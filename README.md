#### docker-simc
Docker image to run [simulationcraft](https://simulationcraft.org)

#### Building
```
docker build -t limed/simc .
```

#### Running
```
docker run limed/simc armory=us,sargeras,limed calculate_scale_factors=1
```

Read [this](https://github.com/simulationcraft/simc/wiki/StartersGuide) for more information on how to use simc
