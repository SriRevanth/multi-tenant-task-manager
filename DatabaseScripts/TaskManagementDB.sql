CREATE DATABASE TaskManagementDB;

USE TaskManagementDB;

-- Create Tenants Table
CREATE TABLE Tenants (
    tenantId UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    organizationName VARCHAR(255) NOT NULL,
    createdDate DATETIME DEFAULT GETDATE()
);

-- Create Table users
CREATE TABLE Users (
    userId UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE NOT NULL,
    passwordHash VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,
    tenantId UNIQUEIDENTIFIER,
    FOREIGN KEY (tenantId) REFERENCES Tenants(tenantId)
);

-- Create Projects Table
CREATE TABLE Projects (
    projectId UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    name VARCHAR(255),
    description TEXT,
    tenantId UNIQUEIDENTIFIER,
    FOREIGN KEY (tenantId) REFERENCES Tenants(tenantId)
);

-- Create Tasks Table
CREATE TABLE Tasks (
    taskId UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    title VARCHAR(255),
    status VARCHAR(50),
    assignedTo UNIQUEIDENTIFIER,
    projectId UNIQUEIDENTIFIER,
    tenantId UNIQUEIDENTIFIER,
    FOREIGN KEY (projectId) REFERENCES Projects(projectId),
    FOREIGN KEY (tenantId) REFERENCES Tenants(tenantId),
    FOREIGN KEY (assignedTo) REFERENCES Users(userId)
);
