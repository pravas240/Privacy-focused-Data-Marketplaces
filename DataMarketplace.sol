// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract DataMarketplace {

    // Declare variables
    string public projectTitle;
    string public projectDescription;

    address public owner;

    // Structure to store user data
    struct Data {
        uint id;
        string dataDescription;
        uint price;
        bool isForSale;
    }

    // Mapping from user address to data owned by them
    mapping(address => Data[]) public userData;

    // Event to notify when a new data entry is added
    event DataAdded(uint id, address indexed user, string dataDescription, uint price);
    event DataBought(uint id, address indexed buyer, uint price);
    event DataListedForSale(uint id, address indexed user, uint price);
    
    // Constructor to initialize the project title and description
    constructor() {
        projectTitle = "Privacy-focused Data Marketplaces";
        projectDescription = "A marketplace where users can monetize their personal data in a secure and anonymous way.";
        owner = msg.sender;
    }

    // Function to add personal data to the marketplace
    function addData(string memory _dataDescription, uint _price) public {
        uint dataId = userData[msg.sender].length;
        userData[msg.sender].push(Data(dataId, _dataDescription, _price, false));

        emit DataAdded(dataId, msg.sender, _dataDescription, _price);
    }

    // Function to list data for sale
    function listDataForSale(uint _dataId, uint _price) public {
        require(_dataId < userData[msg.sender].length, "Data ID not valid");
        Data storage data = userData[msg.sender][_dataId];
        data.isForSale = true;
        data.price = _price;

        emit DataListedForSale(_dataId, msg.sender, _price);
    }

    // Function to buy data from another user
    function buyData(address _seller, uint _dataId) public payable {
        require(_dataId < userData[_seller].length, "Data ID not valid");
        Data storage data = userData[_seller][_dataId];
        require(data.isForSale, "Data not for sale");
        require(msg.value >= data.price, "Insufficient funds");

        // Transfer the data ownership
        data.isForSale = false;
        userData[msg.sender].push(Data(data.id, data.dataDescription, data.price, false));
        
        // Transfer the payment to the seller
        payable(_seller).transfer(msg.value);

        emit DataBought(data.id, msg.sender, data.price);
    }

    // Function to get the project details
    function getProjectDetails() public view returns (string memory, string memory) {
        return (projectTitle, projectDescription);
    }
}
