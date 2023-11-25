source('simulation.r')
#source('E:\\R-4.1.3\\computer_network\\computer_network\\experiment1\\simulation.r')
getwd()
# system information
proc_time <- 0.001
queue_speed <- 275000
trans_speed <- 150000
chan_length <- 100*(1:4)
horizon <- 30
path <- list()
path[[1]] <- c(1, 5, 2)
path[[2]] <- c(1, 5, 2, 6, 3)
path[[3]] <- c(1, 5, 2, 7, 4)
path[[4]] <- c(2, 5, 1)
path[[5]] <- c(2, 6, 3)
path[[6]] <- c(2, 7, 4)
path[[7]] <- c(3, 6, 2, 5, 1)
path[[8]] <- c(3, 6, 2)
path[[9]] <- c(3, 8, 4)
path[[10]] <- c(4, 7, 2, 5, 1)
path[[11]] <- c(4, 7, 2)
path[[12]] <- c(4, 8, 3)


# true input model
# input_true <- c(60, 40, 50, 80, 65, 20, 100, 22, 26, 40, 50, 60, 1/300)
# input_true <- c(50, 30, 40, 60, 55, 20, 70, 22, 26, 35, 40, 50, 1/300)
#input_true <- c(40, 30, 35, 50, 45, 15, 60, 15, 20, 25, 30, 40, 1/300)
# input_true <- c(50, 40, 45, 60, 55, 25, 70, 25, 30, 35, 40, 50, 1/300)
#print(input_true)

samplesize <- 100000

arr_in = matrix(0, nrow = samplesize, ncol = 13)
#arr = array(1:1, dim = c(550, 2, 50))
#arr[120,1] <- 3
toto <- 0

# set seed for rng
#set.seed(322277)
# compute the true value
#for (j in 1:50){
for (i in 1:samplesize) {
  #print(i)
  aa1 <- rgamma(1, shape=20, scale = 1/0.4)
  aa2 <- rgamma(1, shape=20, scale = 1/0.6)
  input_raw <- c(aa1, aa2)
  input_raw <- c(input_raw, rgamma(1, shape=20, scale = 1/0.5))
  input_raw <- c(input_raw, rgamma(1, shape=20, scale = 1/0.3))
  input_raw <- c(input_raw, rgamma(1, shape=20, scale = 1/0.4))
  input_raw <- c(input_raw, rgamma(1, shape=20, scale = 1/1.0))
  input_raw <- c(input_raw, rgamma(1, shape=20, scale = 1/0.3))
  input_raw <- c(input_raw, rgamma(1, shape=20, scale = 1/1.2))
  input_raw <- c(input_raw, rgamma(1, shape=20, scale = 1/0.7))
  input_raw <- c(input_raw, rgamma(1, shape=20, scale = 1/0.6))
  input_raw <- c(input_raw, rgamma(1, shape=20, scale = 1/0.5))
  input_raw <- c(input_raw, rgamma(1, shape=20, scale = 1/0.4))
  arr_in[i,1:12] <- input_raw
  input_true <- c(input_raw, 1/300)
  truth <- get_truth(input_true, 1)
  #save(truth, file = 'truth.RData')
  truth <- truth$mean
  arr_in[i,13] <- truth
  toto <- toto + truth
}

print('finish computing truth')
#print(arr_in)
print(toto/samplesize)
write.csv(arr_in, file = "CF3-truth.csv")

#}

