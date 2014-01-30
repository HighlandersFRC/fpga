CC=g++
CFLAGS=-c -Wall -fPIC -pthread -Inetworktables -Inetworktables2 -Inetworktablesshim -I.
LDFLAGS= -pthread -fPIC
SOURCES=networktables2/AbstractNetworkTableEntryStore.cpp networktables2/NetworkTableEntry.cpp networktables2/NetworkTableNode.cpp networktables2/OutgoingEntryReciever.cpp networktables2/TableKeyExistsWithDifferentTypeException.cpp networktables2/TransactionDirtier.cpp networktables2/WriteManager.cpp networktables/NetworkTable.cpp networktables/NetworkTableConnectionListenerAdapter.cpp networktables/NetworkTableKeyListenerAdapter.cpp networktables/NetworkTableListenerAdapter.cpp networktables/NetworkTableMode.cpp networktables/NetworkTableProvider.cpp networktables/NetworkTableSubListenerAdapter.cpp nttools/NetworkTableTools.cpp networktablesshim/Synchronized.cpp tables/TableKeyNotDefinedException.cpp networktables2/stream/FDIOStream.cpp networktables2/stream/SocketServerStreamProvider.cpp networktables2/stream/SocketStreamFactory.cpp networktables2/stream/SocketStreams.cpp networktables2/client/ClientConnectionAdapter.cpp networktables2/client/ClientConnectionState.cpp networktables2/client/ClientNetworkTableEntryStore.cpp networktables2/client/NetworkTableClient.cpp networktables2/thread/DefaultThreadManager.cpp networktables2/connection/BadMessageException.cpp networktables2/connection/ConnectionMonitorThread.cpp networktables2/connection/DataIOStream.cpp networktables2/connection/NetworkTableConnection.cpp networktables2/type/ArrayData.cpp networktables2/type/ArrayEntryType.cpp networktables2/type/BooleanArray.cpp networktables2/type/ComplexData.cpp networktables2/type/ComplexEntryType.cpp networktables2/type/DefaultEntryTypes.cpp networktables2/type/NetworkTableEntryType.cpp networktables2/type/NetworkTableEntryTypeManager.cpp networktables2/type/NumberArray.cpp networktables2/type/StringArray.cpp networktables2/server/NetworkTableServer.cpp networktables2/server/ServerConnectionAdapter.cpp networktables2/server/ServerConnectionList.cpp networktables2/server/ServerConnectionState.cpp networktables2/server/ServerIncomingStreamMonitor.cpp networktables2/server/ServerNetworkTableEntryStore.cpp networktables2/util/EOFException.cpp networktables2/util/IOException.cpp networktables2/util/IllegalStateException.cpp networktables2/util/StringCache.cpp networktables2/util/System.cpp
OBJECTS=$(SOURCES:.cpp=.o)

all: $(SOURCES) NetTablesTest NetTablesLib
	
NetTablesTest: $(OBJECTS) 
	$(CC) $(LDFLAGS) $(OBJECTS) NetTablesTest.cpp -o $@
NetTablesLib: $(OBJECTS)
	$(CC) -shared $(LDFLAGS) $(OBJECTS) -o NetTables.so
.cpp.o:
	$(CC) $(CFLAGS) $< -o $@
