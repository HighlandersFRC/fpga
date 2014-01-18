#ifndef NETWORKTABLETOOLS_H
#define NETWORKTABLETOOLS_H

#include <string>
#include <tables/ITable.h>
#include <networktables/NetworkTable.h>
#include <networktables/NetworkTableProvider.h>
#include <networktables2/NetworkTableNode.h>
#include <networktables2/thread/NTThreadManager.h>

class NetworkTableTools {
public:
	static const int PORT=1735;
	static std::string GetTeamIP(int team);
	static ITable* GetServerTable(int team,std::string key);
	static ITable* GetServerTable(std::string address,std::string key);
	static ITable* GetClientTable(int team,std::string key);
	static ITable* GetClientTable(std::string address,std::string key);
private:
	static void InitServer(std::string address);
	static void InitClient(std::string address);
	static bool serverInited;
	static NTThreadManager* clientThreadManager;
	static NetworkTableNode* clientNode;
	static NetworkTableProvider* clientProvider;
};

#endif // NETWORKTABLETOOLS_H
