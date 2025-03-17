# Data Marketplace Smart Contract

## Project Title: 
**Privacy-focused Data Marketplaces**

## Project Description:
The **Privacy-focused Data Marketplace** is a decentralized platform where users can monetize their personal data in a secure and anonymous way. This smart contract enables individuals to sell their personal data to others in a privacy-preserving and transparent environment using blockchain technology. The marketplace ensures that data ownership remains with the user while allowing buyers to access and use the data they purchase.

## Features:
- **Add Personal Data:** Users can add their personal data to the marketplace, along with a description and a price.
- **List Data for Sale:** Data owners can list their data for sale at a specified price, making it available for potential buyers.
- **Buy Data:** Users can purchase data from other users, transferring funds securely to the seller.
- **Ownership Transfer:** When data is bought, ownership is transferred from the seller to the buyer.
- **Secure and Anonymous Transactions:** All transactions are performed on the Ethereum blockchain, ensuring transparency, security, and privacy.
- **Project Details:** Users can access the project title and description at any time via the smart contract.

## Contract Functions:
1. **addData(string memory _dataDescription, uint _price):**
   - Allows users to add personal data with a description and price to the marketplace.
   
2. **listDataForSale(uint _dataId, uint _price):**
   - Enables users to list their data for sale by providing the data ID and the desired price.

3. **buyData(address _seller, uint _dataId):**
   - Lets users purchase data from another user by providing the seller’s address and the data ID. The buyer must send the specified amount of Ether to purchase the data.

4. **getProjectDetails():**
   - Returns the project title and description for users to learn more about the marketplace.

## Events:
- **DataAdded(uint id, address indexed user, string dataDescription, uint price):**
   - Emitted when a new data entry is added to the marketplace.
   
- **DataBought(uint id, address indexed buyer, uint price):**
   - Emitted when a data entry is bought by a user.
   
- **DataListedForSale(uint id, address indexed user, uint price):**
   - Emitted when a data entry is listed for sale with the specified price.

## Contract Address:
Contract Address:  0x3f79E1E95cF8c79fd50dF05200C394CeB92c71E9

