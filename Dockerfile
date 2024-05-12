FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /APP

# Copy Everything
COPY . ./
# Restore as distinct layers
RUN dotnet Restore
# Build and publish release
RUN dotnet publish -c Release -o out

# Build Runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /APP
COPY --from=build-env /APP/out .
ENTRYPOINT ["dotnet","DotNet.Docker.dll"]