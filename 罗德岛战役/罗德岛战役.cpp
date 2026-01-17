#include<iostream>
#include<string>
#include<vector>
#include<algorithm>
using namespace std;

//#define T 1
//#define h 50000
//#define d 3000
//#define s 80
//#define m 5
int h, d, s;
int DPS(int n,int a,int b,int c)
{
	int attack = (max(a * 5 / 100, a - d) + max(b * 5 / 100, b * (100 - s) / 100) + c) * n;
	return attack;
}



int main()
{
	int T = 0;
	cin >> T;
	
	int m;
	for (int t = 0; t < T; t++)
	{
		cin >> h >> d >> s;
		cin >> m;
		int opt = 0;
		vector<string> str;
		int n[50];
		int a[50];
		int b[50];
		int c[50];
		
		for (int i = 0; i < m; i++)
		{
			int sum = 0;
			string nstr;
			cin >> opt;
			cin >> nstr;
			switch (opt)
			{
			case 1:
			{
			if (find(str.begin(), str.end(), nstr) != str.end())//ÒÑÔÚ±à¶Ó
			{
				cin >> n[i] >> a[i] >> b[i] >> c[i];
				str.push_back(nstr);
				int j = 0;
				n[i] = 0;
				a[i] = 0;
				b[i] = 0;
				c[i] = 0;
				for (j = 0; j <= i; j++)
				{
					sum += DPS(n[j], a[j], b[j], c[j]);
					if (sum >= h)
					{
						cout << "Yes" << endl;
						break;
					}
				}
				if (j > i)
					cout << "No" << endl;
			}
			else
			{
				cin >> n[i] >> a[i] >> b[i] >> c[i];
				str.push_back(nstr);
				int j = 0;
				for (j = 0; j <= i; j++)
				{
					sum += DPS(n[j], a[j], b[j], c[j]);
					if (sum >= h)
					{
						cout << "Yes" << endl;
						break;
					}
				}
				if (j > i)
					cout << "No" << endl;
			}
				break;
			}
			case 2:
			{
				if (find(str.begin(), str.end(), nstr) != str.end())
				{
					auto it = find(str.begin(), str.end(), nstr);

					n[distance(str.begin(), it)] = 0;
					a[distance(str.begin(), it)] = 0;
					b[distance(str.begin(), it)] = 0;
					c[distance(str.begin(), it)] = 0;
					while (it != str.end())
					{
						it = str.erase(it);
						it = find(it, str.end(), nstr);
					}
					int j = 0;
					n[i] = 0;
					a[i] = 0;
					b[i] = 0;
					c[i] = 0;
					for (j = 0; j <= i; j++)
					{
						sum += DPS(n[j], a[j], b[j], c[j]);
						if (sum >= h)
						{
							cout << "Yes" << endl;
							break;
						}
					}
					if (j > i)
						cout << "No" << endl;
				}
				else
				{
					int j = 0;
					n[i] = 0;
					a[i] = 0;
					b[i] = 0;
					c[i] = 0;
					for (j = 0; j <= i; j++)
					{
						sum += DPS(n[j], a[j], b[j], c[j]);
						if (sum >= h)
						{
							cout << "Yes" << endl;
							break;
						}
					}
					if (j > i)
						cout << "No" << endl;
				}

				break;
			}
			}
		}
	}
	return 0;
}