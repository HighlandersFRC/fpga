#include "nttools/NetworkTableTools.h"

#include <string>
#include <tables/ITable.h>
#include <networktables/NetworkTable.h>
#include <networktables/NetworkTableMode.h>
#include <networktables/NetworkTableProvider.h>
#include <networktables2/NetworkTableNode.h>
#include <networktables2/thread/DefaultThreadManager.h>
#include <networktables2/thread/NTThreadManager.h>

bool NetworkTableTools::serverInited=false;
NTThreadManager* NetworkTableTools::clientThreadManager=NULL;
NetworkTableNode* NetworkTableTools::clientNode=NULL;
NetworkTableProvider* NetworkTableTools::clientProvider=NULL;

std::string NetworkTableTools::GetTeamIP(int team) {
	char tmp[30];
	sprintf(tmp,"%d.%d.%d.%d\n",10,team/100,team%100,2);
	return std::string(tmp);
}

ITable* NetworkTableTools::GetServerTable(int team,std::string key) {
	return GetServerTable(GetTeamIP(team),key);
}

ITable* NetworkTableTools::GetServerTable(std::string address,std::string key) {
	InitServer(address);
	return NetworkTable::GetTable(key);
}

ITable* NetworkTableTools::GetClientTable(int team,std::string key) {
	return GetClientTable(GetTeamIP(team),key);
}

ITable* NetworkTableTools::GetClientTable(std::string address,std::string key) {
	InitClient(address);
	if(clientProvider==NULL) {
		return NULL;
	}
	return clientProvider->GetTable("/"+key);
}

void NetworkTableTools::InitServer(std::string address) {
	if(serverInited) {
		return;
	}
	NetworkTable::SetIPAddress(address.c_str());
	NetworkTable::Initialize();
	serverInited=true;
}

void NetworkTableTools::InitClient(std::string address) {
        printf("attempting to Init client\n");
	if(clientProvider!=NULL) {
		return;
	}
	clientThreadManager=new DefaultThreadManager();
	NetworkTableNode* clientNode=NetworkTableMode::Client.CreateNode(address.c_str(),1735,*clientThreadManager);
	clientProvider=new NetworkTableProvider(*clientNode);
}
