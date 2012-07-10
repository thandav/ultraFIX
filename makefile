CPP_SRC_FILES	:= \
		LIBXML_DOMDocument.cpp	\
		Acceptor.cpp	\
		CallStack.cpp	\
		DataDictionary.cpp	\
		DataDictionaryProvider.cpp	\
		Dictionary.cpp	\
		FieldMap.cpp	\
		FieldTypes.cpp	\
		FileLog.cpp	\
		FileStore.cpp	\
		Group.cpp	\
		HttpConnection.cpp	\
		HttpMessage.cpp	\
		HttpParser.cpp	\
		HttpServer.cpp	\
		Initiator.cpp	\
		Log.cpp	\
		Message.cpp	\
		MessageStore.cpp	\
		MessageSorters.cpp	\
		NullStore.cpp	\
		Parser.cpp	\
		Session.cpp	\
		SessionFactory.cpp	\
		SessionSettings.cpp	\
		Settings.cpp	\
		SocketAcceptor.cpp	\
		SocketConnection.cpp	\
		SocketConnector.cpp	\
		SocketInitiator.cpp	\
		SocketMonitor.cpp	\
		SocketServer.cpp	\
		ThreadedSocketAcceptor.cpp	\
		ThreadedSocketConnection.cpp	\
		ThreadedSocketInitiator.cpp	\
		TimeRange.cpp	\
		Utility.cpp	\

CC=g++
CCFLAGS=-fPIC -g -w -I/usr/include/libxml2
LDFLAGS=-lxml2 -lboost_system
OBJS=$(CPP_SRC_FILES:.cpp=.o)
LIB_TARGET=libquickfix.so

$(LIB_TARGET): $(OBJS)
	$(CC) -dynamiclib -o $@ $(OBJS) $(LDFLAGS)

.cpp.o:
	$(CC) $(CCFLAGS) -c $< -o $@

all: $(LIB_TARGET)

clean:
	rm -rf *.o $(LIB_TARGET)

