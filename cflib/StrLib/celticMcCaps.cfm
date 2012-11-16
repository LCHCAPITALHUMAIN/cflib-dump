function celticMcCaps(lastName) {
    var capLastName = lCase(lastName);
    if (left(lastName,2) eq "Mc") {
        capLastName = uCase(left(lastName,1)) & lCase(mid(lastName,2,1)) & uCase(mid(lastName,3,1)) & lCase(right(lastName,len(lastName)-3));
        return capLastName;
    }
    else if (left(lastName,3) eq "Mac") {
        capLastName = uCase(left(lastName,1)) & lCase(mid(lastName,2,1)) & lCase(mid(lastName,3,1)) & uCase(mid(lastName,4,1)) & lCase(right(lastName,len(lastName)-4));
        return capLastName;
    }
    else if (left(lastName,2) eq "O'") {
        capLastName = uCase(left(lastName,1)) & "'" & uCase(mid(lastName,3,1)) & lCase(right(lastName,len(lastName)-3));
        return capLastName;
    }
    else return lastName;
}