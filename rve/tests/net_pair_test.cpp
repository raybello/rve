#include "net.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>

#define SOCK_PATH "/tmp/rve_net_pair_test.sock"

static int run_server()
{
    net_init(SOCK_PATH, true);
    if (net_fd_conn == -1) {
        fprintf(stderr, "server: net_init failed\n");
        return 1;
    }

    // Send a message to the client
    const char *msg = "hello from server";
    net_send((uint8_t *)msg, (uint32_t)strlen(msg));

    // Wait to receive echo back
    for (int i = 0; i < 5000; i++) {
        uint8_t *data = nullptr;
        uint32_t len  = 0;
        if (net_recv(&data, &len)) {
            bool ok = (len == strlen(msg) && memcmp(data, msg, len) == 0);
            free(data);
            if (!ok) {
                fprintf(stderr, "server: echo mismatch\n");
                return 1;
            }
            printf("server: round-trip OK (%u bytes)\n", len);
            return 0;
        }
        usleep(1000);
    }

    fprintf(stderr, "server: timed out waiting for echo\n");
    return 1;
}

static int run_client()
{
    // Brief wait for server socket to be ready
    usleep(20000);

    net_init(SOCK_PATH, false);
    if (net_fd_conn == -1) {
        fprintf(stderr, "client: net_init failed\n");
        return 1;
    }

    // Wait for server message then echo it back
    for (int i = 0; i < 5000; i++) {
        uint8_t *data = nullptr;
        uint32_t len  = 0;
        if (net_recv(&data, &len)) {
            printf("client: received %u bytes, echoing back\n", len);
            net_send(data, len);
            free(data);
            return 0;
        }
        usleep(1000);
    }

    fprintf(stderr, "client: timed out waiting for server message\n");
    return 1;
}

int main()
{
    unlink(SOCK_PATH);

    pid_t pid = fork();
    if (pid < 0) {
        perror("fork");
        return 1;
    }

    if (pid == 0) {
        // Child: client
        int rc = run_client();
        _exit(rc);
    }

    // Parent: server
    int server_rc = run_server();

    int status = 0;
    waitpid(pid, &status, 0);
    int client_rc = WIFEXITED(status) ? WEXITSTATUS(status) : 1;

    unlink(SOCK_PATH);

    if (server_rc != 0 || client_rc != 0) {
        fprintf(stderr, "net_pair_test FAILED (server=%d client=%d)\n",
                server_rc, client_rc);
        return 1;
    }

    printf("net_pair_test PASSED\n");
    return 0;
}
