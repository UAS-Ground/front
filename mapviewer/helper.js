/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

.pragma library

function roundNumber(number, digits)
{
    var multiple = Math.pow(10, digits);
    return Math.round(number * multiple) / multiple;
}

function formatTime(sec)
{
    var value = sec
    var seconds = value % 60
    value /= 60
    value = (value > 1) ? Math.round(value) : 0
    var minutes = value % 60
    value /= 60
    value = (value > 1) ? Math.round(value) : 0
    var hours = value
    if (hours > 0) value = hours + "h:"+ minutes + "m"
    else value = minutes + "min"
    return value
}

function formatDistance(meters)
{
    var dist = Math.round(meters)
    if (dist > 1000 ){
        if (dist > 100000){
            dist = Math.round(dist / 1000)
        }
        else{
            dist = Math.round(dist / 100)
            dist = dist / 10
        }
        dist = dist + " km"
    }
    else{
        dist = dist + " m"
    }
    return dist
}


function SalesmanNode(prev_id,lat, lon){
    this.id = prev_id;
    this.lat = lat
    this.lon = lon
    this.neighbors = {}
    this.neighborIds = []
    this.visited = false;
}

SalesmanNode.prototype.addNeighbor = function(neighbor, cost){
    if(neighbor.lat !== this.lat || neighbor.lon !== this.lon){
        console.log("In node " + this.id + "'s addNeighbor(), adding node " + neighbor.id + " ... ");
        this.neighborIds.push(neighbor.id);
        this.neighbors[neighbor.id] = {
            node: neighbor,
            cost: cost

        };
    } else {
        console.log("In node " + this.id + "'s addNeighbor(), detected that node " + neighbor.id + " is a duplicate");
    }
}

SalesmanNode.prototype.print = function(){
    console.log("    Neighbor Node: " + this.id);
    console.log("              Lat: " + this.lat);
    console.log("              Lon: " + this.lon);
}

SalesmanNode.prototype.getStr = function(){
    return "" + this.id;
}

function SalesmanGraph(){
    this.ids = []
    this.nodes = {}
}

SalesmanGraph.prototype.print = function(){

    console.log("Let's look at the graph::");
    for(var i = 0; i < this.ids.length; i++){
        var out_str = "";


        out_str += this.ids[i] + ": ---";
//        console.log("On node " + this.ids[i] + ": ");
//        console.log("  Lat: " + this.nodes[this.ids[i]].lat);
//        console.log("  Lon: " + this.nodes[this.ids[i]].lon);
        var neighborIds = this.nodes[this.ids[i]].neighborIds;
        for(var j = 0; j < neighborIds.length; j++){
            //this.nodes[this.ids[i]].neighbors[neighborIds[j]].node.print();
            out_str += "---" + this.nodes[this.ids[i]].neighbors[neighborIds[j]].node.getStr();
            //console.log(" --COST: " + this.nodes[this.ids[i]].neighbors[this.nodes[this.ids[i]].neighborIds[j]].cost);
            out_str += "(" + this.nodes[this.ids[i]].neighbors[this.nodes[this.ids[i]].neighborIds[j]].cost + ")---";
        }
        console.log(out_str);

    }
}

SalesmanGraph.prototype.addNode = function(lat, lon){
    var id;
    if(this.ids.length < 1){
        id = 1;
    } else {
        id = this.nodes[this.ids[this.ids.length - 1]].id + 1;
    }

    this.nodes[id] = new SalesmanNode(id, lat, lon);
    var curNode = this.nodes[id];
    this.ids.push(id)
    console.log('just added node with id: ' + id);
    for(var i = 0; i < this.ids.length; i++){
        console.log('in addNode(), looking at: ' + this.nodes[this.ids[i]].id + ', lat: ' + this.nodes[this.ids[i]].lat + "");
        var neighbor = this.nodes[this.ids[i]];
        var diffLat = Math.abs(curNode.lat - neighbor.lat);
        var diffLon= Math.abs(curNode.lon - neighbor.lon);
        var distance = Math.sqrt( Math.pow(diffLat * 100, 2) + Math.pow(diffLon * 100, 2) );

//        neighbor.neighbors[curNode.id] = {
//           node: curNode,
//           cost: distance
//        };
//        neighbor.neighborIds.push(curNode.id);
//        curNode.neighbors[neighbor.id] = {
//           node: neighbor,
//           cost: distance
//        };
//        curNode.neighborIds.push(neighbor.id);

        neighbor.addNeighbor(curNode, distance);
        curNode.addNeighbor(neighbor, distance);


    }
}

SalesmanGraph.prototype.shortestPath = function(lat, lon){
    var fromNode = new SalesmanNode(85, lat, lon);

    for(var i = 0; i < this.ids.length; i++){
        console.log('in shortestPath(), looking at: ' + this.nodes[this.ids[i]].id + ', lat: ' + this.nodes[this.ids[i]].lat + "");
        var neighbor = this.nodes[this.ids[i]];
        var diffLat = Math.abs(fromNode.lat - neighbor.lat);
        var diffLon= Math.abs(fromNode.lon - neighbor.lon);
        var distance = Math.sqrt( Math.pow(diffLat * 100, 2) + Math.pow(diffLon * 100, 2) );

        neighbor.addNeighbor(fromNode, distance);
        fromNode.addNeighbor(neighbor, distance);
    }


    // do algorithm

    //this.print();

    var newCoords = [];

    var curNode = fromNode;
    newCoords.push({
       latitude: curNode.lat,
       longitude: curNode.lon
    });
    var done = false;

    for(var k = 0; k < this.ids.length; k++){
        this.nodes[this.ids[k]].visited = false;
    }
    console.log("Starting salesman algorithm from node " + curNode.id);
    var iter = 0;
    var currentMinNode = null;
    while(!done){
        var allNeighborsVisited = true;
        var currentMin = Number.POSITIVE_INFINITY;
        console.log("while() iter " + iter);
        for(i = 0; i < curNode.neighborIds.length; i++){
            var currentNode = curNode.neighbors[curNode.neighborIds[i]];
            console.log("     on neighbor " + currentNode.node.id);
            if(!currentNode.node.visited){
                allNeighborsVisited = false;
                console.log("          not yet visited!");
                if(currentNode.cost < currentMin){
                    currentMin = currentNode.cost;
                    currentMinNode = currentNode;
                    console.log("               and its the min neighbor with cost " + currentMin);
                }
            } else {
                console.log("          already visited!");

            }
        }
        if(allNeighborsVisited){
            console.log("I have that all neighbors were visited");
            done = true;

        } else {
            curNode.visited = true;
            curNode = currentMinNode.node;
            console.log("I have that all neighbors were NOT yet visited, now iterating on node " + curNode.id);
            newCoords.push({
               latitude: curNode.lat,
               longitude: curNode.lon
            });
        }
        iter++;
        if(iter > 20) break;

    }




    for(i = 0; i < this.ids.length; i++){
        for(var j = 0; j < this.nodes[this.ids[i]].neighborIds.length; j++){
            if(this.nodes[this.ids[i]].neighbors[this.nodes[this.ids[i]].neighborIds[j]].node === fromNode){
                this.nodes[this.ids[i]].neighborIds.splice(j, 1);
                break;
            }
        }

    }

    return newCoords;



}


