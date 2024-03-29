#ifndef __SYLAR_LOG_H__
#define __SYLAR_LOG_H__

#include <string>
#include <stdint.h>
#include <memory>
#include <list>
#include <sstream>
#include <fstream>
#include <iostream>
#include <vector>

namespace sylar {
	class Logger;

	class LogLevel{
	public:
		enum Level {
			UNKNOW = 0,
			DEBUG = 1,
			INFO = 2,
			WARN = 3,
			ERROR = 4,
			FATAL = 5
		};
		static const char* ToString(LogLevel::Level level);
	};

	// 日志事件
	class LogEvent{
	public:
		typedef std::shared_ptr<LogEvent> ptr;
		LogEvent(const char* file, int32_t m_line, uint32_t elapse, 
			uint32_t thread_id, uint32_t fiber_id, uint64_t time);

		const char* getFile() const {return m_file;}
		int32_t getLine() const {return m_line;}
		uint32_t getElapse() const {return m_elapse;}
		uint32_t getThreadId() const {return m_threadId;}
		uint32_t getFiberId() const {return m_fiberId;}
		uint64_t getTime() const {return m_time;}

		std::string getContent() const {return m_ss.str();}
		std::stringstream& getSS() {return m_ss;}
	private:
		const char* m_file = nullptr;   //文件名
		int32_t m_line = 0;             //行号
		uint32_t m_elapse = 0;          //程序启动开始到现在的毫秒数
		uint32_t m_threadId = 0;        //线程id
		uint32_t m_fiberId = 0;         //协程id
		uint64_t m_time = 0;            //时间戳
		std::stringstream m_ss;

	};
	
	// 日志格式器
	class LogFormatter {
	public:
		typedef std::shared_ptr<LogFormatter> ptr;
		LogFormatter(const std::string& pattern);

		std::string format(std::shared_ptr<Logger> logger, LogLevel::Level level, LogEvent::ptr event);
		std::ostream& format(std::ostream& ofs, std::shared_ptr<Logger> logger, LogLevel::Level level, LogEvent::ptr event);
	public:
		class FormatItem {
		public:
			typedef std::shared_ptr<FormatItem> ptr;
			FormatItem(const std::string& fmt = "") {};
			virtual ~FormatItem() {}
			virtual void format(std::ostream& os, std::shared_ptr<Logger> logger, LogLevel::Level level, LogEvent::ptr event) = 0;
		};
		void init();
	private:
		std::string m_pattern;
		std::vector<FormatItem::ptr> m_items;
	};

	// 日志输出地
	class LogAppender {
	public:
		typedef std::shared_ptr<LogAppender> ptr;
		virtual ~LogAppender() {}

		virtual void log(std::shared_ptr<Logger> logger, LogLevel::Level level, LogEvent::ptr event) = 0;  //纯虚函数，子类必须实现

		void setFormatter(LogFormatter::ptr val) {m_formatter = val;}
		LogFormatter::ptr getFormatter() const { return m_formatter;}

		void setLevel(LogLevel::Level val) {m_level = val;}
		LogLevel::Level getLevel() const {return m_level;}
	protected:
		LogLevel::Level m_level = LogLevel::DEBUG;
		LogFormatter::ptr m_formatter;
	};

	// 日志输出器
	class Logger : public std::enable_shared_from_this<Logger> {
	public:
		typedef std::shared_ptr<Logger> ptr;
		Logger(const std::string& name = "root");

		void log(LogLevel::Level level, LogEvent::ptr event);
		void debug(LogEvent::ptr event);
		void info(LogEvent::ptr event);
		void warn(LogEvent::ptr event);
		void error(LogEvent::ptr event);
		void fatal(LogEvent::ptr event);
		LogLevel::Level getLevel() const {return m_level;}
		void setLevel(LogLevel::Level val) { m_level = val; }

		void addAppender(LogAppender::ptr appender);
		void delAppender(LogAppender::ptr appender);

		const std::string getName() {return m_name;}
		void setName(const std::string name) {m_name = name;}
	private:
		std::string m_name;                       //日志名称
		LogLevel::Level m_level;                  //日志级别
		std::list<LogAppender::ptr> m_appenders;  //Appender集合
		LogFormatter::ptr m_formatter;

	};

	// 输出到控制台的Appender
	class StdoutLogAppender : public LogAppender {
	public:
		typedef std::shared_ptr<StdoutLogAppender> ptr;
		void log(Logger::ptr logger, LogLevel::Level level, LogEvent::ptr event) override;

	};

	class FileLogAppender : public LogAppender {
	public:
		typedef std::shared_ptr<FileLogAppender> ptr;
		FileLogAppender(const std::string& filename);
		void log(Logger::ptr logger, LogLevel::Level level, LogEvent::ptr event) override; 
        	bool reopen();
	private:
		std::string m_filename;
        	std::ofstream m_filestream;

	};
}


#endif
