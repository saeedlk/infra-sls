import { QueryCommand } from "@aws-sdk/client-dynamodb";
import { ScanCommand } from "@aws-sdk/client-dynamodb";
import { ddbClient } from "./dynamodb.mjs";


import { response, Error } from "./global.mjs";


export const handler = async (event) => {

    const params = {
        //KeyConditionExpression: "Season = :s and Episode > :e",
        //FilterExpression: "contains (Subtitle, :topic)",
        //ExpressionAttributeValues: {
        //  ":s": { N: "1" },
        //  ":e": { N: "2" },
        //  ":topic": { S: "SubTitle" },
        //},
        //  ProjectionExpression: "UserID, Name",
        TableName: "Service",
    };
    try {
        const data = await ddbClient.send(new ScanCommand(params));
        // const data = await ddbClient.send(new QueryCommand(params));

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