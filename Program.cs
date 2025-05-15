#pragma warning disable AOAI001

using System;
using System.ClientModel;
using System.Text.Json;
using Azure;

// Add Azure OpenAI package
using Azure.AI.OpenAI;
using Azure.AI.OpenAI.Chat;
using OpenAI.Chat;

var searchEndpoint = Environment.GetEnvironmentVariable("SEARCH_ENDPOINIT") ?? "";
var searchKey = Environment.GetEnvironmentVariable("SEARCH_KEY") ?? "";
var searchIndex = Environment.GetEnvironmentVariable("SEARCH_INDEX") ?? "";

var openaiEndpoint = Environment.GetEnvironmentVariable("OPENAI_ENDPOINT") ?? "";
var openaiKey = Environment.GetEnvironmentVariable("OPENAI_KEY") ?? "";
var openaiDeployName = Environment.GetEnvironmentVariable("OPENAI_DEPLOY_NAME") ?? "";

AzureOpenAIClient azureClient = new(new Uri(openaiEndpoint), new ApiKeyCredential(openaiKey));
ChatClient chatClient = azureClient.GetChatClient(openaiDeployName);

ChatCompletionOptions chatCompletionsOptions = new ChatCompletionOptions()
{

    MaxOutputTokenCount = 600,
    Temperature = 0.9f,
};

chatCompletionsOptions.AddDataSource(new AzureSearchChatDataSource()
{
    Endpoint = new Uri(searchEndpoint),
    Authentication = DataSourceAuthentication.FromApiKey(searchKey),
    IndexName = searchIndex,
});

ChatCompletion completion = chatClient.CompleteChat(
    [
        new SystemChatMessage("You are an AI assistant that helps with travel-related inquiries, offering tips, advice, and recommendations as a knowledgeable travel agent."),
        new UserChatMessage("what is the best hotel in New York?"),
    ],
    chatCompletionsOptions);

ChatMessageContext onYourDataContext = completion.GetMessageContext();

if (onYourDataContext?.Intent is not null)
{
    Console.WriteLine($"Intent: {onYourDataContext.Intent}");
}

// Print response
Console.WriteLine($"{completion.Role}: {completion.Content[0].Text}");

Console.WriteLine($"\n  Citations of data used:");

foreach (ChatCitation citation in onYourDataContext?.Citations ?? [])
{
    Console.WriteLine($"Citation: {citation.Content}");
}
