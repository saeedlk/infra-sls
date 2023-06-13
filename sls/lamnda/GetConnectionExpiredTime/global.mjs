
const Error = (message, StatusCode = '404', Owner) => {
    let body = {
        Error: 'Bad Request',
        ErrorCode: StatusCode,
        Message: message,
        Owner: Owner,
    };
    let response = {
        statusCode: '400',
        body: JSON.stringify(body),
        headers: {
            'Content-Type': 'application/json',
        }
    };
    // context.succeed(response);
    return response;
};

const response = (body) => {
    let response = {
        statusCode: 200,
        body: JSON.stringify(body),
        headers: {
            'Content-Type': 'application/json',
        }
    };
    // context.succeed(response);
    return response;
}

export { Error, response };