pragma solidity ^0.8.17;
contract TicketSale {
 // <contract_variables>
 // </contract_variables>
 uint public numTickets;
 uint public price;
 adress public manager;

  struct Ticket {
      uint ticketId;
      uint status;
      address owner; 
  }

  Ticket[] public ticketList;
  mapping(adress => uint) public ticketOwners;
  mapping(adress => bool) public swapList;
  mapping (uint => address) ticketsSold;
 constructor(uint numTickets, uint price) public {
  numT=numTickets;
  priceOfTicket=price;
  manager=msg.sender;
 }
 function buyTicket(uint ticketId) public payable {
 require(ticketId >= 1 && ticketId <= numT); 
        require(ticketsSold[ticketId] == 0); 
        require(tickets[msg.sender] == 0); 
        require(msg.value == priceOfTicket); 
        tickets[msg.sender] = ticketId;
        ticketsSold[ticketId] = msg.sender;
 }
 function getTicketOf(address person) public view returns (uint) {
 return ticketOwners[person];
 }
 function offerSwap(address partner) public {
 require(ticketOwners[msg.sender] > 0); 
        require(partner != msg.sender); 
        swapOffers[msg.sender] = partner;
 }
 function acceptSwap(address partner) public {
  require(ticketOwnders[msg.sender] > 0); 
        require(swapOffers[partner] == msg.sender); 
        (ticketOwners[msg.sender], ticketOwners[partner]) = (ticketOwners[partner], ticketOwners[msg.sender]); 
        ticketsSold[ticketOwners[msg.sender]] = msg.sender;
        ticketsSold[ticketOwners[partner]] = partner;
        swapOffers[partner] = 0;
 }
}
