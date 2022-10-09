const { ethers } = require("ethers");
const abi = require("./abi.json");

const SC = "0xe8C565ef8426A351452C73965cC7276a40f47f24";

async function main() {
  // Configuring the connection to an Ethereum node
  const network = process.env.ETHEREUM_NETWORK;
  const provider = new ethers.providers.InfuraProvider(
    network,
    process.env.INFURA_API_KEY
  );
  // Creating a signing account from a private key
  const signer = new ethers.Wallet(process.env.SIGNER_PRIVATE_KEY, provider);

  // devolverprice1
  const contract = new ethers.Contract(SC, abi, signer);
  const price1 = await contract.devolverprice1();
  const price2 = await contract.devolverprice2();
  const price3 = await contract.devolverprice3();
  // const promedio = await contract.devolverpromedio();

  console.log(price1.toString()/10**18);
  console.log(price2.toString()/10**18);
  console.log(price3.toString()/10**18);
  // console.log(promedio.toString()/10**18);
  
}

require("dotenv").config();
main();