// Importing necessary functionalities from the Hardhat package.
import { ethers } from 'hardhat';

async function main() {
  console.log('Deploying contracts... Please wait.')
  const [deployer] = await ethers.getSigners();
  console.log('Deploying contracts with the account:', deployer.address);
  const MiningToken = await ethers.getContractFactory('MiningToken');
  const miningToken = await MiningToken.deploy();
  await miningToken.deployed();
  console.log('MiningToken contract is deployed to:', miningToken.address);
}

// This pattern allows the use of async/await throughout and ensures that errors are caught and handled properly.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
