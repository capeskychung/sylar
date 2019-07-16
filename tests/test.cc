#include <iostream>
#include "sylar/log.h"

int main(int argc, char** argv) {
	std::cout << "enter sylar log" << std::endl;
	sylar::Logger::ptr logger(new sylar::Logger);
	std::cout << "0000000000" << std::endl;
	logger->addAppender(sylar::LogAppender::ptr(new sylar::StdoutLogAppender));
	std::cout << "111111111111111111111" << std::endl;
	sylar::LogEvent::ptr event(new sylar::LogEvent(__FILE__, __LINE__, 0, 1, 2, time(0)));
	event->getSS() << "hello sylar log";
	std::cout << "2222222222222222" << std::endl;
	logger->log(sylar::LogLevel::DEBUG, event);
	std::cout << "333333333333333" << std::endl;
	std::cout << "hello sylar log" << std::endl;

	return 0;
}
