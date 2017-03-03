#ifndef CCSDS_PACKET_H
#define CCSDS_PACKET_H

class CCSDSPacket {
private:
	int size;
	char * content;
public:
	CCSDSPacket(char*);
	int getSize();

};

#endif // CCSDS_PACKET_H