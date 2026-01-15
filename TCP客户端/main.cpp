#define _CRT_SECURE_NO_WARNINGS
#define _WINSOCK_DEPRECATED_NO_WARNINGS
#include<stdio.h>
#include <WinSock2.h>
#pragma comment(lib,"ws2_32.lib")

int main()
{
	WSADATA wsaData;
	WSAStartup(MAKEWORD(2, 2), &wsaData);
	//创建套接字
	SOCKET client_socket = socket(AF_INET, SOCK_STREAM, 0);
	if (client_socket == INVALID_SOCKET)
	{
		printf("创建失败\n");
		return -1;
	}
	else
	{
		printf("创建套接字成功...\n");
	}
	//连接服务器
	struct sockaddr_in target;
	target.sin_family = AF_INET;
	target.sin_port = htons(8080);
	printf("输入你的IP地址:");
	char IP[16] = { 0 };
	scanf("%s", IP);
	target.sin_addr.s_addr = inet_addr(IP);
	//target.sin_addr.s_addr = inet_addr("127.0.0.1");

	if (connect(client_socket, (struct sockaddr*)&target, sizeof(target)) == -1)
	{
		printf("连接失败\n");//一般是服务器不在线
		closesocket(client_socket);
		return -1;
	}
	else
	{
		printf("连接成功...\n");
	}
	//开始通讯
	while (1)
	{
		char sbuffer[1024] = { 0 };
		printf("请输入：");
		scanf("%s", sbuffer);
		send(client_socket, sbuffer, strlen(sbuffer), 0);

		char rbuffer[1024] = { 0 };
		int ret = recv(client_socket, rbuffer, 1024, 0);
		if (ret <= 0) break;
		else printf("'%s'对方已收到\n", rbuffer);
	}
	closesocket(client_socket);
	return 0;
}