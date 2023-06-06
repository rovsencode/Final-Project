import React from "react";
import {
  Card,
  CardActionArea,
  CardMedia,
  CardHeader,
  CardContent,
  Typography,
  Box,
  Rating,
} from "@mui/material";
import Icon from "@mdi/react";
import { mdiStar } from "@mdi/js";

const ExpectedCard = ({ name, genre, imageUrl, rating }) => {
  return (
    <Card sx={{ maxWidth: 190, backgroundColor: "#2b2b31" }}>
      <CardActionArea>
        <CardMedia
          component="img"
          alt={name}
          src={imageUrl}
          sx={{
            height: "auto",
            objectFit: "cover",
            width: "100%",
            borderRadius: 0,
          }}
        />
        <CardContent>
          <Typography variant="h5" component="div" sx={{ color: "white" }}>
            {name}
          </Typography>
          <Typography variant="subtitle2" sx={{ color: "#ff55a5" }}>
            {genre}
          </Typography>
          <Box sx={{ display: "flex", alignItems: "center", marginTop: 1 }}>
            <Icon
              path={mdiStar}
              size={1}
              color="#ff55a5" 
            />
            <Typography
              variant="body2"
              sx={{ color: "white", marginLeft: 0.5 }}
            >
              {rating}
            </Typography>
          </Box>
        </CardContent>
      </CardActionArea>
    </Card>
  );
};

export default ExpectedCard;
