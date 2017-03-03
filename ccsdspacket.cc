#include "ccsdspacket.h"

CCSDSPacket::CCSDSPacket(char * content){
	this->content = content;
	this->size = sizeof(content) / sizeof(content[0]);
}

int CCSDSPacket::getSize(){
	return this->size;
}