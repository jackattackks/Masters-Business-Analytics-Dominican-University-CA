# Clearing the Environment ----
rm(list=ls())

library(readxl)
data <- read_excel("C:/Users/Angie Menjivar/Downloads/FINAL DATASET.xlsx")
View(data)

colnames(data)

library(ggplot2)


# graph for how many students finished and didn't finish the survey ----
# Calculate the count of each value in the column
count_data <- table(data$"Finished")

# Convert the count data to a data frame
count_df <- data.frame(Value = names(count_data), Count = as.numeric(count_data))

# Create a bar plot of the count
bar_plot <- ggplot(count_df, aes(x = Value, y = Count)) +
  geom_bar(stat = "identity", fill = "orange") +
  labs(x = "Value", y = "Count") +
  ggtitle("Non Completed vs Completed Surveys") +
  geom_text(aes(label = Count), vjust = -0.5)

# Show the bar plot
print(bar_plot)

# graph for percentage of how many students are willing to work hard regardless of impact on their grade ----
# Calculate the percentage of each value in the column
percentage_data <- prop.table(table(data$"agree_workhard")) * 100

# Convert the percentage data to a data frame
percentage_df <- data.frame(Value = names(percentage_data), Percentage = as.numeric(percentage_data))

# Create a bar plot of the percentages
bar_plot <- ggplot(percentage_df, aes(x = Value, y = Percentage)) +
  geom_bar(stat = "identity", fill = "tomato") +
  labs(x = "Value", y = "Percentage") +
  ggtitle("Percentage Distribution of Students willing to work hard")+
  geom_text(aes(label = sprintf("%.1f%%", Percentage)), vjust = -0.5)

# Show the bar plot
print(bar_plot)

# graph for percentage of how many students agree that getting the best grades is important----
percentage_data <- prop.table(table(data$"agree_grades")) * 100

# Convert the percentage data to a data frame
percentage_df <- data.frame(Value = names(percentage_data), Percentage = as.numeric(percentage_data))

# Create a bar plot of the percentages
bar_plot <- ggplot(percentage_df, aes(x = Value, y = Percentage)) +
  geom_bar(stat = "identity", fill = "hotpink") +
  labs(x = "Value", y = "Percentage") +
  ggtitle("Percentage Distribution of Importance of getting the best grades") +
  geom_text(aes(label = sprintf("%.1f%%", Percentage)), vjust = -0.5)

# Show the bar plot
print(bar_plot)

# graph of percentage of academic experiences will be most enjoyable ----
percentage_data <- prop.table(table(data$"agree_enjoyable")) * 100

# Convert the percentage data to a data frame
percentage_df <- data.frame(Value = names(percentage_data), Percentage = as.numeric(percentage_data))

# Create a bar plot of the percentages
bar_plot <- ggplot(percentage_df, aes(x = Value, y = Percentage)) +
  geom_bar(stat = "identity", fill = "seagreen2") +
  labs(x = "Value", y = "Percentage") +
  ggtitle("Percentage Distribution of Academic Experience being the most enjoyable") +
  geom_text(aes(label = sprintf("%.1f%%", Percentage)), vjust = -0.5)

# Show the bar plot
print(bar_plot)

# graph of percentage of feeling confident choosing to attend DU ----
percentage_data <- prop.table(table(data$"confidence_attend")) * 100

# Convert the percentage data to a data frame
percentage_df <- data.frame(Value = names(percentage_data), Percentage = as.numeric(percentage_data))

# Create a bar plot of the percentages
bar_plot <- ggplot(percentage_df, aes(x = Value, y = Percentage)) +
  geom_bar(stat = "identity", fill = "plum") +
  labs(x = "Value", y = "Percentage") +
  ggtitle("Percentage Distribution of Confidence attending DU") +
  geom_text(aes(label = sprintf("%.1f%%", Percentage)), vjust = -0.5)

# Show the bar plot
print(bar_plot)

# graph for confidence of knowing what to major in ----
percentage_data <- prop.table(table(data$"confidence_major")) * 100

# Convert the percentage data to a data frame
percentage_df <- data.frame(Value = names(percentage_data), Percentage = as.numeric(percentage_data))

# Create a bar plot of the percentages
bar_plot <- ggplot(percentage_df, aes(x = Value, y = Percentage)) +
  geom_bar(stat = "identity", fill = "royalblue") +
  labs(x = "Value", y = "Percentage") +
  ggtitle("Percentage Distribution of Confidence knowing what to major in") +
  geom_text(aes(label = sprintf("%.1f%%", Percentage)), vjust = -0.5)

# Show the bar plot
print(bar_plot)

# graph for how many students feel prepared to begin a meaningful career by the time they graduate----
percentage_data <- prop.table(table(data$"gradgoals_career")) * 100

# Convert the percentage data to a data frame
percentage_df <- data.frame(Value = names(percentage_data), Percentage = as.numeric(percentage_data))

# Create a bar plot of the percentages
bar_plot <- ggplot(percentage_df, aes(x = Value, y = Percentage)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(x = "Value", y = "Percentage") +
  ggtitle("Percentage Distribution of beginning a meaningful career") +
  geom_text(aes(label = sprintf("%.1f%%", Percentage)), vjust = -0.5)

# Show the bar plot
print(bar_plot)

# graph for how many students feel they should learn new things that will help in life ----
percentage_data <- prop.table(table(data$"gradgoals_learned")) * 100

# Convert the percentage data to a data frame
percentage_df <- data.frame(Value = names(percentage_data), Percentage = as.numeric(percentage_data))

# Create a bar plot of the percentages
bar_plot <- ggplot(percentage_df, aes(x = Value, y = Percentage)) +
  geom_bar(stat = "identity", fill = "darkcyan") +
  labs(x = "Value", y = "Percentage") +
  ggtitle("Percentage Distribution of learning new things that will help in life") +
  geom_text(aes(label = sprintf("%.1f%%", Percentage)), vjust = -0.5)

# Show the bar plot
print(bar_plot)

# ethnicities ----
ethnicities <- data.frame("race_African",                         
                          "race_African_American_Black",          
                          "race_Alaska_Native",                   
                          "race_Asian",                           
                          "race_Asian_American",                  
                          "race_Caribbean_West_Indian",           
                          "race_Hispanic_Latinoa",                
                          "race_Latin_American",                  
                          "race_Middle_Eastern",                  
                          "race_Native_American_American_Indian", 
                          "race_Native_Hawaiian_Pacific_Islander",
                          "race_South_Asian",                     
                          "race_Southeast_Asian",                
                          "race_White",                           
                          "race_Other",                           
                          "race_PNTR")

# Convert character values to numeric in the ethnicities data frame
ethnicities <- data.frame(apply(ethnicities, 2, as.numeric))

# Create a data frame with the count of each ethnicity category
ethnicity_counts <- data.frame(
  Ethnicity = colnames(ethnicities),
  Count = colSums(ethnicities, na.rm = TRUE)
)

# Sort the data frame by the count in descending order
ethnicity_counts <- ethnicity_counts[order(ethnicity_counts$Count, decreasing = TRUE), ]

# Create a bar plot of the ethnicity counts
bar_plot <- ggplot(ethnicity_counts, aes(x = reorder(Ethnicity, Count), y = Count)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(x = "Ethnicity", y = "Count") +
  ggtitle("Ethnicity Distribution")

# Rotate x-axis labels for better visibility
bar_plot <- bar_plot + theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Show the bar plot
print(bar_plot)
