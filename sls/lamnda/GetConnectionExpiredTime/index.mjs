import { QueryCommand } from "@aws-sdk/client-dynamodb";
import { ScanCommand } from "@aws-sdk/client-dynamodb";
import { ddbClient } from "./dynamodb.mjs";


import { response, Error } from "./global.mjs";


export const handler = async (event) => {

    let now = Date.now();
    const params = {
       // KeyConditionExpression: "ServerAddress = :sip",
        FilterExpression: "ExpireDate <= :exp", //for scan
       // IndexName: "ExpireDate-index",
        // ExpressionAttributeNames: {
        //     "#ExpireDate": "ExpireDate",
        // },
        ExpressionAttributeValues: {
            //":exp": { N: Date.now()+""},
            ":exp": { "N": now+""},
         //   ":sip": { "N": "192.168.1.10"},
        },
        //  ProjectionExpression: "UserID, Name",
        TableName: "Service",
    };
    try {
        const data = await ddbClient.send(new ScanCommand(params));
        //const data = await ddbClient.send(new QueryCommand(params));

        var res = {
            data: data.Items,
            data_count: data.Count,
            act: '',
            status: "succeeded",
            statusCode: 200
        }
        return response(res);
    } catch (err) {
        console.error("Error", err);
        return Error(err, '500');
    }

}