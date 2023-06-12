import { DynamoDBClient } from "@aws-sdk/client-dynamodb";

const AWS_REGION = process.env.AWS_REGION;
const ddbClient = new DynamoDBClient({ region: AWS_REGION });

export { ddbClient };