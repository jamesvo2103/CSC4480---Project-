# Big East Basketball Database

## Project Summary
This project is a **Big East basketball database application** designed to store and organize information about **teams, players, coaches, games, and player statistics** for the **2025–2026 season**.

The database is intended to model how teams and players interact across a season while maintaining clear relationships between entities such as teams, seasons, games, and player performance data.

---

## Business Rules

- Each team is identified by a unique **TeamID** and has one team name.
- Each season is identified by a unique **SeasonID** and represents one specific year or year range.
- A team can participate in many seasons, and a season can include many teams.
- Each team has **at most one coach per season**.
- A coach can coach **only one team per season**.
- Each player is identified by a unique **PlayerID** and belongs to one team in a season.
- A team can have many players in a season, but each player record is associated with only one team for that season.
- Each game is identified by a unique **GameID** and occurs in one season.
- Each game must involve **exactly two teams**.
- A team can play many games in a season.
- A player can appear in many games, and a game can include many players.
- The relationship between players and games is recorded through **PlayerGameStats**.
- Each **PlayerGameStats** record belongs to one player and one game.
- A player can have **at most one PlayerGameStats record per game**.
- A **PlayerGameStats** record cannot exist unless the corresponding player and game already exist in the database.

---

## Project Scope Restrictions

Because the Big East includes **11 teams**, each with roughly **15 players** and **30+ games**, entering complete data for every team, player, and game would be unnecessarily time-consuming for this project.

To keep the project manageable, the database will include only:

- **4–5 teams**
- **5–6 players per team**
- **6–7 games per team**

This smaller sample still allows the database to demonstrate all major relationships and functionality without requiring a full conference dataset.

---
