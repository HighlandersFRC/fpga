#include "networktables/NetworkTable.h"
#include "nttools/NetworkTableTools.h"

int main() {
    ITable* table = NetworkTableTools::GetClientTable("10.44.99.2", "SmartDashboard");
    printf("connected: %d\n", ((NetworkTable*)table)->IsConnected());
    table->PutString("Beagle Bone Black says", "Hello SmartDashboard");
    while(true) {}
}
