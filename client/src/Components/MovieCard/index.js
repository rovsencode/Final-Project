import React, { useState } from "react";
import Icon from "@mdi/react";
import { mdiHeart } from "@mdi/js";
import { mdiThumbUpOutline } from "@mdi/js";
import { mdiThumbDownOutline } from "@mdi/js";

import {
  Card,
  CardActionArea,
  CardMedia,
  CardHeader,
  CardActions,
  IconButton,
  CardContent,
  Typography,
  Chip,
  Box,
  Rating,
} from "@mui/material";

const MovieCard = ({
  title,
  category,
  imageUrl,
  description,
  rating,
  ageRestriction,
  quality,
  likeActive,
  disLikeActive,
  Year,
}) => {
  const [clickLike, setClickLike] = useState(false);
  const handleClickLike = () => {
    setClickLike(!clickLike);
  };
  return (
    <Card sx={{ maxWidth: 350, maxHeight: 350, backgroundColor: "#2B2B31" }}>
      <CardHeader
        title={category}
        titleTypographyProps={{ variant: "subtitle2", color: "pink" }}
      />
      <CardActionArea>
        <Box sx={{ display: "flex", flexDirection: "row" }}>
          <CardMedia
            component="img"
            alt={title}
            src={imageUrl}
            sx={{
              objectFit: "cover",
              height: 200,
              width: 140,
              borderRadius: 0,
            }}
          />

          <CardContent sx={{ color: "white" }}>
            <Typography
              gutterBottom
              variant="h5"
              component="div"
              sx={{ fontSize: 18 }}
            >
              {title} ({Year})
            </Typography>
            <Typography
              variant="body2"
              color="white"
              component="p"
              sx={{ marginBottom: 1, fontSize: 14, opacity: 0.6 }}
            >
              {description.length > 100
                ? `${description.slice(0, 100)}...`
                : description}
            </Typography>
            <Box
              sx={{
                display: "flex",
                justifyContent: "space-between",
                alignItems: "center",
              }}
            >
              <Chip label={quality} color="primary" size="small" />
              <Chip label={ageRestriction} color="secondary" size="small" />
              <Rating value={parseFloat(rating)} precision={0.1} readOnly />
            </Box>
          </CardContent>
        </Box>
      </CardActionArea>
      <CardActions>
        {/* <IconButton onClick={handleClickLike} aria-label="add to favorites">
          <Icon color={clickLike ? "red" : "white"} path={mdiHeart} size={1} />
        </IconButton> */}
        {likeActive !== undefined && disLikeActive !== undefined && (
          <>
            <IconButton>
              <Icon
                color={likeActive ? "blue" : "white"}
                path={mdiThumbUpOutline}
                size={1}
              />
            </IconButton>
            <IconButton>
              <Icon
                color={disLikeActive ? "blue" : "white"}
                path={mdiThumbDownOutline}
                size={1}
              />
            </IconButton>
          </>
        )}
      </CardActions>
    </Card>
  );
};

export default MovieCard;
