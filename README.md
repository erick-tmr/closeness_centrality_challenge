# Facebook Closeness Centrality Social Analyzer

## Brief Description
A closeness centrality analyser that ranks the nodes in a graph from an adjacency list or from a Facebook's user friends list.

## This repository is the solution to the following challenge
In this challenge, suppose we are looking to do social network analysis for prospective customers. We want to extract from their social network a metric called "closeness centrality".

Centrality metrics try to approximate a measure of influence of an individual within a social network. The distance between any two vertices is their shortest path. The farness of a given vertex v is the sum of all distances from each vertex to v. Finally, the closeness of a vertex v is the inverse of the farness.

The first part of the challenge is to rank the vertices in a given graph by their closeness. The graph is provided in the attached file; each line of the file consists of two vertex names separated by a single space, representing an edge between those two nodes.

The second part of the challenge is to plug your algorithm on Facebook's API and rank the centrality of the social graph extracted from one user and his list of friends. A good start might be the mutual friends API. In order to exercise your code, you can use Facebook’s sandbox Test Users feature (you can find it under Roles).

## Outling the solution
From the challenge exercise, we assume that the given graph is an **Unweighted and Undirected Graph**.</br>
To calculate the **closeness centrality** metric we need to find the **shortest path lenght (distance)** between a node and all other nodes from a given graph, in order to do that we can use the **Breadth First Search Algorithm (BFS)**, that traverses the graph and find a shortest path (not all of them, just "a") between two nodes. With all the distances in hand we can calculate the closeness centrality from that node.

<p style="text-align: center;"><img src="https://upload.wikimedia.org/wikipedia/commons/4/46/Animated_BFS.gif" alt="Breadth First Search Ilustrated"></p>

## Setting up the project
- Clone this repository to your local machine.
- In the *data* directory, edit the *app_settings* file with your Facebook App settings (if you want to use the Facebook functionalities)
- Add any *adjacency list data file* in the *data* directory, you can look at the suplied files to see examples of the formatting
- Add the *lib* directory to your environment variable *RUBYLIB* or run the scripts with the *-I* parameter, specifying the *lib* directory path
- Run the *main.rb* script inside the *bin* directory and have fun :smiley::thumbsup: 

## Dependencies
- [Koala](https://github.com/arsduo/koala)

## Managing your Facebook app
In the *facebook_social_graph* there is a class named *facebook_testusers_manager* that you can use to manage the test users from your app, the methods have pretty straight forward name meaning, you can create, list and *be friend* your users.</br>
*Obs: Please notice that due to the Facebook API calls these methods can be a bit slow to run.*

## Tests
In the *tests* directory there are some test suits, bundled by libs, using the Ruby built-in MiniTest Framework. Just run the scripts to see the tests.

## References
- [Closeness Centrality](http://en.wikipedia.org/wiki/Centrality#Closeness_centrality)
- [Facebook API](https://developers.facebook.com/docs/graph-api/reference/v2.0/user/friends)
- [Facebook API (mutual friends)](https://developers.facebook.com/docs/graph-api/reference/v2.0/user.context/mutual_friends)
- [Shortest path](http://en.wikipedia.org/wiki/Shortest_path_problem)
