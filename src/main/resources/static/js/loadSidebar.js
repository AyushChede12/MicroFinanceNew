/*$(document).ready(function(){
	
});
function loadSidebar(session) {
    console.log("Session: ", session);

    // Example sidebar elements
    const admin = document.getElementById('admin');
    const masters = document.getElementById('masters');
    const entry = document.getElementById('entry');
    const clientDms = document.getElementById('clientDms');
    const factoryDms = document.getElementById('factoryDms');
    const stock = document.getElementById('stock');
    const factorystock = document.getElementById('factorystock');
    const factoryOut = document.getElementById('factoryOut');
    

    const UserCreate = document.getElementById('UserCreate');
    const UserMenuAccess = document.getElementById('UserMenuAccess');
    const UserManage = document.getElementById('UserManage');
    const itemMaster = document.getElementById('itemMaster');
    const companyMaster = document.getElementById('companyMaster');
    const stockEntry = document.getElementById('stockEntry');
    const entryReport = document.getElementById('entryReport');
    const clientDmsGeneration = document.getElementById('clientDmsGeneration');
    const clientDmsReport = document.getElementById('clientDmsReport');
    const factoryDmsGeneration = document.getElementById('factoryDmsGeneration');
    const factoryDmsReport = document.getElementById('factoryDmsReport');
    const stockStatement = document.getElementById('stockStatement');
    const factorystockStatement = document.getElementById('factorystockStatement');
   const factoryInDms = document.getElementById('factoryInDms');
   const generateFactoryOut = document.getElementById('generateFactoryOut');
    const factoryOutReport = document.getElementById('factoryOutReport');
    

    // Check if session is null or empty
    if (!session || session.length === 0) {
        console.log("Session is null or empty.");
        alert("Session is null or empty.");
        return;
    }

    // Initially hide all elements
    admin.style.display = 'none';
    UserCreate.style.display = 'none';
    UserMenuAccess.style.display = 'none';
    UserManage.style.display = 'none';
    masters.style.display = 'none';
    companyMaster.style.display = 'none';
    itemMaster.style.display = 'none';
    entry.style.display = 'none';
    stockEntry.style.display = 'none';
    entryReport.style.display = 'none';
    clientDms.style.display = 'none';
    clientDmsGeneration.style.display = 'none';
    clientDmsReport.style.display = 'none';
    factoryDms.style.display = 'none';
    factoryDmsGeneration.style.display = 'none';
    factoryDmsReport.style.display = 'none';
    stock.style.display = 'none';
    stockStatement.style.display = 'none';
    factorystock.style.display = 'none';
    factorystockStatement.style.display = 'none';
    factoryInDms.style.display = 'none';
    factoryOut.style.display = 'none';
    generateFactoryOut.style.display = 'none';
    factoryOutReport.style.display = 'none';
    
    
    
    
    
    // Example visibility logic based on session data
    // User Master
    if (session.includes("User Create")) {
        admin.style.display = 'block';
        UserCreate.style.display = 'block';
    }

    if (session.includes("User Menu Access")) {
        admin.style.display = 'block';
        UserMenuAccess.style.display = 'block';
    }

    if (session.includes("User Manage")) {
        admin.style.display = 'block';
        UserManage.style.display = 'block';
    }

    // Masters
    if (session.includes("Item Master")) {
        masters.style.display = 'block';
        itemMaster.style.display = 'block';
    }

    if (session.includes("Company Master")) {
        masters.style.display = 'block';
        companyMaster.style.display = 'block';
    }

    // Stock Entry
    if (session.includes("Stock Entry")) {
        entry.style.display = 'block';
        stockEntry.style.display = 'block';
    }

    if (session.includes("Entry Report")) {
        entry.style.display = 'block';
        entryReport.style.display = 'block';
    }

    // Client DMs
    if (session.includes("Generate DM for Client")) {
        clientDms.style.display = 'block';
        clientDmsGeneration.style.display = 'block';
    }

    if (session.includes("Client DM Report")) {
        clientDms.style.display = 'block';
        clientDmsReport.style.display = 'block';
    }

    // Factory DMs
    if (session.includes("Generate DM for Factory")) {
        factoryDms.style.display = 'block';
        factoryDmsGeneration.style.display = 'block';
    }

    if (session.includes("Factory DM Report")) {
        factoryDms.style.display = 'block';
        factoryDmsReport.style.display = 'block';
    }

    // Stock
    if (session.includes("Stock Statement")) {
        stock.style.display = 'block';
        stockStatement.style.display = 'block';
    }

    // Factory In DMS
    if (session.includes("Factory Stock Statement")) {
        factorystock.style.display = 'block';
        factorystockStatement.style.display = 'block';
    }
    
    // 
     if (session.includes("Factory IN DMs")) {
        factorystock.style.display = 'block';
        factoryInDms.style.display = 'block';
    }
    
    
    // Factory Out Dms
    if (session.includes("Generate Factory OUT")) {
        factoryOut.style.display = 'block';
        generateFactoryOut.style.display = 'block';
    }
    
    if (session.includes("Factory OUT Report")) {
        factoryOut.style.display = 'block';
        factoryOutReport.style.display = 'block';
    }
    
    
    
}
*/