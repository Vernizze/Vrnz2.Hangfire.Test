FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
EXPOSE 80
EXPOSE 443

COPY . .

WORKDIR /src
RUN dotnet restore "Vrnz2.Hangfire.Test.csproj"
RUN dotnet build "Vrnz2.Hangfire.Test.csproj" -c Release -o /app/build

FROM build AS publish

RUN dotnet publish "Vrnz2.Hangfire.Test.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Vrnz2.Hangfire.Test.dll"]