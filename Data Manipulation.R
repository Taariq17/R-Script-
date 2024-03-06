#Data Manipulation: Data Manipulation deals with simple operations such as summarizing, aggregation, filtering.
# R Data Manipulation functions are: 1.Select 2. Filter 3. Arrange 4. Mutate
#Data Manipulation
#Select 
library(dplyr)
library(hflights)
View(hflights)
select(hflights, FlightNum,ArrTime,DepTime) -> flight1 # By using select function we choose the particular columns from hflights dataset. Whenever we are using select inside the bracket we have to mention data-set name in first and then following you can type which column you are preferring.
View(flight1)
select(hflights,5,6,7,8) ->flight2 # We can also select the column by number. For a instance FlightNum is in 5th column we can type 5 in select function and get that column.
View(flight2)
select(hflights,contains("Time")) ->flight3 # In this code we will get the columns which contain Time.
View(flight3)
select(hflights,Year:ArrTime) ->flight4
View(flight4)
select(hflights, starts_with("Day"),ends_with("Time")) -> flight5
View(flight5)

#Mutate: With the help of mutate function we can bring in new columns by tweaking the old columns that is over here from the hedge flights data set i am subtracting the air time from the actual elapsed time
mutate(hflights,ActualGroundTime = ActualElapsedTime-AirTime) ->mflight1
View(mflight1)
mutate(mflight1,AverageSpeed= Distance/AirTime*60) ->mflight2 #In this code we are creating a new colum to show the avaerage speed of the flight
View(mflight2)
mutate(mflight2,TotalTaxiHours = TaxiIn +TaxiOut) ->mflight3 # To find the total of hours taxi journey. I have added TaxiIn and TaxiOut time to find total hours.
View(mflight3)
mutate(mflight3,TimeLoss=ArrDelay + DepDelay) -> mflight4 # To find flight delay hours i have added Arrival delay time with Depature Delay time
View(mflight4)

#Filter
filter(mflight4, Distance > 2500) ->flightf1 # I have filter with data with distance which is more than 2500
View(flightf1)
range(flightf1$Distance)
mflight4 %>% count(UniqueCarrier) #Count Function
filter(hflights, UniqueCarrier %in% c("AS","CO","F9")) ->flightf2
View(flightf2)
table(flightf2$UniqueCarrier) #Simialar to count function
filter(hflights, TaxiIn+TaxiOut > AirTime) ->flightf3 #Filtering data by adding Taxi In and Out time and using greater symbol.
View(flightf3)
filter(hflights, DepTime<500|ArrTime>2200) -> flightf4 # Filtering data by getting data with DepTime less than 500 or ArrTime greater than 2200.
View(flightf4)
filter(hflights, Dest=="AUS" & Cancelled==1) ->flightf5 #Filter the data by dest == AUS and checking how many flights are cancelled
View(flightf5)

#arrange : It will arrange the data either in ascending order or descending order
arrange(hflights,DepDelay)-> Dflight1
View(Dflight1)
arrange(hflights,AirTime)-> Dflight2
View(Dflight2)
arrange(hflights,DepDelay+ArrDelay)->Dflight3
View(Dflight3)

#Summarise: It's very handy function it will give me the immediate result in quick
summarise(hflights, min_dist=min(Distance),max_dist = max(Distance))
summarise(hflights, earilest= min(ArrDelay, na.rm = T),average=mean(ArrDelay, na.rm = T),
          latest = max(ArrDelay,na.rm=T), sd=sd(ArrDelay,na.rm = T))
#Pipe Operators(%>%)

hflights %>% select(contains("Time")) %>% filter(AirTime>60) -> Pflight1
View(Pflight1)
range(Pflight1$AirTime)
hflights %>% filter(UniqueCarrier=="CO") %>% summarise(Min_Time = min(AirTime,na.rm = T))
