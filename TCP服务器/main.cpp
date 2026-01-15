#define _WINSOCK_DEPRECATED_NO_WARNINGS
#include <stdio.h>
#include <string.h>
#include <WinSock2.h>
#pragma comment(lib,"ws2_32.lib")

int main()
{
	WSADATA wsaData;
	WSAStartup(MAKEWORD(2, 2), &wsaData);
	//创建套接字
	SOCKET listen_socket = socket(AF_INET, SOCK_STREAM, 0);// 协议地址簇,协议类型(流式协议/帧式协议）,保护协议 (0)
	if (listen_socket == INVALID_SOCKET)//无效socket 0
	{
		printf("创建失败,错误码: %d\n", GetLastError());
		return -1;
	}
	else
	{
		printf("创建套接字成功...\n");
	}
	//绑定端口号
	//struct sockaddr_in {
	//	ADDRESS_FAMILY sin_family; //协议地址簇
	//	USHORT sin_port; //端口号
	//	IN_ADDR sin_addr; //IP地址
	//	CHAR sin_zero[8]; //保留字节
	//};
	struct sockaddr_in local = { 0 };
	local.sin_family = AF_INET;
	local.sin_port = htons(8080);//大小端转换  端口号
	//local.sin_addr.s_addr = htonl(INADDR_ANY);//限定IP地址，一般全0地址表示全部都接收
	//inet_addr("")将字符串IP地址转换成整数IP
	local.sin_addr.s_addr = inet_addr("0.0.0.0");
	//int bind(SOCKET s, const struct sockddr* name,int namelen)
	// struct sockaddr{
	//  ADDRESS_FAMILY sa_family;
	//	CHAR sa_data[14];
    //}
	if (bind(listen_socket, (struct sockaddr*)&local, sizeof(local)) == -1)
	{
		printf("绑定失败,错误码: %d\n", GetLastError());
		return -1;
	}
	else
	{
		printf("绑定成功...\n");
	}
	//开启监听
	//int listen(SOCKET s, int backlog);
	if (listen(listen_socket, 10) == -1)
	{
		printf("开启监听失败,错误码: %d\n", GetLastError());
		return -1;
	}
	else
	{
		printf("开启监听成功...\n");
	}
	//等待客户端连接 
	//SOCKET accept(SOCKET s, struct sockaddr* addr, int addrlen);//监听socket，客户端的IP地址和端口号，结构的大小
	//返回可通讯的socket 阻塞函数，有客户端连接进来则接受连接
	//多客户端需要while（1）循环
	while (1) {
		SOCKET client_socket = accept(listen_socket, NULL, NULL);
		if (client_socket == INVALID_SOCKET)
		{
			continue;
		}
		while (1) {
			//开始通讯
			char buffer[1024] = { 0 };
			//int recv(SOCKET s, char* buf, int len, int flags);//客户端socket，接受的数据存储位置，接受长度，0）
			int ret = recv(client_socket, buffer, 1024, 0);
			if (ret <= 0) break;
			printf("%s\n", buffer);

			send(client_socket, buffer, strlen(buffer), 0);
		}
		//关闭连接
		closesocket(client_socket);
	}
}