exports.handler = async (event) => {
    const tableName = process.env.DYNAMODB_TABLE_NAME || 'not set';
    const environment = process.env.ENVIRONMENT || 'not set';

    const message = `Hello, World!\nDYNAMODB_TABLE_NAME: ${DYNAMODB_TABLE_NAME}\nENVIRONMENT: ${ENVIRONMENT}`;

    return {
        statusCode: 200,
        body: JSON.stringify(message),
    };
};
