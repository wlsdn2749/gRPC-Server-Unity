using UnityEngine;
using System.Threading.Tasks;
using Grpc.Net.Client;
using Cysharp.Net.Http;
using Helloworld;

public class SimpleCall : MonoBehaviour
{
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    private async void Start()
    {
        await CallGrpc();
    }

    private async Task CallGrpc()
    {
        // gRPC 채널 생성
        using var handler = new YetAnotherHttpHandler() { Http2Only = true }; // Unity에서 HttpClient 호환을 위해 필요
        using var channel = GrpcChannel.ForAddress("http://127.0.0.1:50051", new GrpcChannelOptions
        {
            HttpHandler = handler,
            DisposeHttpClient = true
        });

        var client = new Greeter.GreeterClient(channel);

        try
        {
            var reply = await client.SayHelloAsync(new HelloRequest { Name = "Unity" });
            Debug.Log("gRPC 응답: " + reply.Message);
        }
        catch (System.Exception ex)
        {
            Debug.LogError("gRPC 오류: " + ex.Message); 
        }
    }
}
