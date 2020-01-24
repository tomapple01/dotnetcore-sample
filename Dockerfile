FROM mcr.microsoft.com/dotnet/core/sdk:3.0-nanoserver-1809 AS build
WORKDIR /src
COPY mydotnetapp.csproj .
RUN dotnet restore
COPY . .
RUN del bin obj /Q
RUN dotnet publish -c release -o /app
WORKDIR /app
ENV ASPNETCORE_URLS http://+:80
ENTRYPOINT ["dotnet", "mydotnetapp.dll"]