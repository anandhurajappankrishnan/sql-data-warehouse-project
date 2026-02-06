/*
=====================================================================
Create Database and Schemas
=====================================================================

Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking
    if it already exists. If the database exists, it is dropped and recreated.
    Additionally, the script sets up three schemas within the database:
    'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists.
    All data in the database will be permanently deleted. Proceed with caution
    and ensure you have proper backups before running this script.
=====================================================================
*/

USE master;  -- Switching to the master database
GO

-- If the database exists, force close connections and drop it
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END
GO

-- Create the database
CREATE DATABASE DataWarehouse;
GO

-- Switch to the new database
USE DataWarehouse;
GO

-- Create schemas (Bronze/Silver/Gold layers)
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
