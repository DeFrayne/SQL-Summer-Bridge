# Table for user names. One-to-many with table Groups.
CREATE TABLE Users
(
	user_id int PRIMARY KEY,
    username varchar(30) NOT NULL,
    group_id int REFERENCES Groups(group_id)
);

# Table for group names. Many-to-one relationship with table Users and many-to-many relationship
# with table Rooms.
CREATE TABLE Groups
(
	group_id int PRIMARY KEY,
    groupname varchar(30) NOT NULL UNIQUE
);

# Table for group names. Many-to-many relationship with Users.
CREATE TABLE Rooms
(
	room_id int PRIMARY KEY,
    roomname varchar(30) NOT NULL UNIQUE
);

# Linker table for the many-to-many relationship of table Rooms and table Groups.
CREATE TABLE GroupsRooms
(
	group_id int NOT NULL REFERENCES Groups(group_id),
    room_id int NOT NULL REFERENCES Rooms(room_id)
);

INSERT INTO Users(user_id, username, group_id) VALUES (1, 'Modesto', 3);
INSERT INTO Users(user_id, username, group_id) VALUES (2, 'Ayine', 3);
INSERT INTO Users(user_id, username, group_id) VALUES (3, 'Christopher', 1);
INSERT INTO Users(user_id, username, group_id) VALUES (4, 'Cheong woo', 1);
INSERT INTO Users(user_id, username, group_id) VALUES (5, 'Saulat', 2);
INSERT INTO Users(user_id, username) VALUES (6, 'Heidy');

INSERT INTO Groups(group_id, groupname) VALUES (1, 'Sales');
INSERT INTO Groups(group_id, groupname) VALUES (2, 'Administration');
INSERT INTO Groups(group_id, groupname) VALUES (3, 'I.T.');
INSERT INTO Groups(group_id, groupname) VALUES (4, 'Operations');

INSERT INTO Rooms(room_id, roomname) VALUES (1, '101');
INSERT INTO Rooms(room_id, roomname) VALUES (2, '102');
INSERT INTO Rooms(room_id, roomname) VALUES (3, 'Auditorium A');
INSERT INTO Rooms(room_id, roomname) VALUES (4, 'Auditorium B');

INSERT INTO GroupsRooms(group_id, room_id) VALUES (1, 2);
INSERT INTO GroupsRooms(group_id, room_id) VALUES (1, 3);
INSERT INTO GroupsRooms(group_id, room_id) VALUES (3, 1);
INSERT INTO GroupsRooms(group_id, room_id) VALUES (3, 2);

# All groups, and the users in each group.
# A group should appear even if there are no users assigned to the group.
SELECT Groups.groupname, Users.username
FROM Groups
LEFT JOIN Users
ON Groups.group_id = Users.group_id
ORDER BY Groups.groupname;

# All rooms, and the groups assigned to each room. The rooms should appear even if no groups have been
# assigned to them.
SELECT Rooms.roomname, Groups.groupname
FROM Rooms
LEFT JOIN GroupsRooms
ON Rooms.room_id = GroupsRooms.room_id
LEFT JOIN Groups
ON Groups.group_id = GroupsRooms.group_id
ORDER BY Rooms.room_id;

# A list of users, the groups that they belong to, and the rooms to which they are assigned. This should be
# sorted alphabetically by user, then by group, then by room
SELECT Users.username, Groups.groupname, Rooms.roomname
FROM Users
LEFT JOIN GroupsRooms
ON GroupsRooms.group_id = users.group_id
LEFT JOIN Rooms
ON Rooms.room_id = GroupsRooms.room_id
LEFT JOIN Groups
ON Groups.group_id = Users.group_id
ORDER BY 1, 2, 3;