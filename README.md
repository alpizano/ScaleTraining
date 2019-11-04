# Information

The point of this training was to take existing SQL queries in Applied Systems code base and optimize the SQL queries in any way, shape, or form.

Some ways to optimize the queries were removing unncessary joins and selecting only the columns that were needed.

# Layered Architecture
One think you might immediatley notice about the folder hierarchy of **Business**, **Data**, **DataAccess**, and **UI**.

This is an architectural design pattern that Applied System used. It is known as a ###layered design pattern. It consist of:

1. UI layer
2. Business logic layer
3. DataAccess layer
4. Data layer

The basic summary is that the UI layer consist of the presentation layer or GUI (graphical user interface), where as the Business logic layer consist of the code that calls the DataAccess layers and layers than do not need to be seen. The Data layer is a class that holds all the data returned (if any) by the DataAccess layers which can be sent to the Business logic layer and then populated to the UI for the client to see.

You can read more about architectural design patterns here:
https://towardsdatascience.com/10-common-software-architectural-patterns-in-a-nutshell-a0b47a1e9013
