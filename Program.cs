#pragma warning disable AOAI001

using System.ClientModel;

// Add Azure OpenAI package
using Azure.AI.OpenAI;
using Azure.AI.OpenAI.Chat;
using OpenAI.Chat;

var searchEndpoint = Environment.GetEnvironmentVariable("SEARCH_ENDPOINT") ?? "";
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

if (args.Length > 0 && args[0] == "onyourdata")
{
    chatCompletionsOptions.AddDataSource(new AzureSearchChatDataSource()
    {
        Endpoint = new Uri(searchEndpoint),
        Authentication = DataSourceAuthentication.FromApiKey(searchKey),
        IndexName = searchIndex,
    });
}

string userMessage = "What's the best hotels in New York? Please answer in Japanese and just the names of the hotels.";
Console.WriteLine($"User: {userMessage}");

ChatCompletion completion = chatClient.CompleteChat(
    [
        new SystemChatMessage("You are a helpful trip advisor."),
        new UserChatMessage(userMessage),
    ],
    chatCompletionsOptions);

ChatMessageContext onYourDataContext = completion.GetMessageContext();

// if (onYourDataContext?.Intent is not null)
// {
//     Console.WriteLine($"Intent: {onYourDataContext.Intent}");
// }

// Print response
Console.WriteLine($"{completion.Role}: {completion.Content[0].Text}");

// Console.WriteLine($"\n  引用元データ:");

// foreach (ChatCitation citation in onYourDataContext?.Citations ?? [])
// {
//     Console.WriteLine($"Citation: {citation.Content}");
// }
