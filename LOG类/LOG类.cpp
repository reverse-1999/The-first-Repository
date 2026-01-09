#include<iostream>

class LOG
{
public:
	const int LogLevelError = 0;
	const int LogLevelWarning = 1;
	const int LogLevelInfo = 2;
private:
	int m_LogLevel = LogLevelInfo;
public:
	void SetLevel(int level)
	{
		m_LogLevel = level;
	}
	void Warn(const char* warning)
	{
		if (m_LogLevel >= LogLevelWarning)
		    std::cout << "[Warning]:" << warning << std::endl;
	}
	void Info(const char* information)
	{
		if (m_LogLevel >= LogLevelInfo)
		std::cout << "[Info]:" << information << std::endl;
	}
	void Error(const char* error)
	{
		if (m_LogLevel >= LogLevelError)
		std::cout << "[Error]:" << error << std::endl;
	}
};

int main()
{
	LOG log;
	log.SetLevel(log.LogLevelWarning);
	log.Warn("Stop!");
	log.Error("Stop!");
	log.Info("Stop!");
	std::cin.get();
}