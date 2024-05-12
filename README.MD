using this article : https://learn.microsoft.com/en-us/dotnet/core/docker/build-container?tabs=windows&pivots=dotnet-8-0


This is an intro to containerization of a DOT NET APP.

At first we created the application : 
    dotnet new console -o App -n DotNet.Docker
We passed parameters to the application :
    dotnet run -- 5
published the application : 
    dotnet publish -c Release

Created Dockerfile:
    see Dockerfile
Built Image:
    docker build -t counter-image -f Dockerfile .

Create Container:
    docker create --name core-counter counter-image

Viewed all Containers:
    docker ps -a

Start Container:
    docker start core-counter

Viewed only running containers:
    docker ps

Start Container and view output at runtime with --sig-proxy=false which prevents container from stopping running when we press Ctrl+C:
    1.docker start core-counter
    2.docker attach --sig-proxy=false core-counter

Deleted Container:
    docker rm core-counter

Docker Create + Docker Start in one command, adding option to delete container when process is stopped:
    docker run -it --rm counter-image

Pass parameters to running container:
    docker run -it --rm counter-image 3