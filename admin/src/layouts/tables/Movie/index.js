/* eslint-disable react/prop-types */
/* eslint-disable react/function-component-definition */
/**
=========================================================
* Material Dashboard 2 React - v2.2.0
=========================================================

* Product Page: https://www.creative-tim.com/product/material-dashboard-react
* Copyright 2023 Creative Tim (https://www.creative-tim.com)

Coded by www.creative-tim.com

 =========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
*/
// @mui material components
import Grid from "@mui/material/Grid";
import Card from "@mui/material/Card";
import { Button } from "@mui/material";
import DeleteIcon from "@mui/icons-material/Delete";
import EditIcon from "@mui/icons-material/Edit";
import IconButton from "@mui/material/IconButton";
// Material Dashboard 2 React example components
import DashboardLayout from "examples/LayoutContainers/DashboardLayout";
import DashboardNavbar from "examples/Navbars/DashboardNavbar";

// Material Dashboard 2 React components
import MDBox from "components/MDBox";
import MDTypography from "components/MDTypography";
import MDAvatar from "components/MDAvatar";
import axios from "axios";
import React from "react";
import DataTable from "examples/Tables/DataTable";
import { Link } from "react-router-dom";

export default function MovieTable() {
  const Movie = ({ image, name }) => (
    <MDBox display="flex" alignItems="center" lineHeight={1}>
      <MDAvatar src={image} name={name} size="sm" />
      <MDBox ml={2} lineHeight={1}>
        <MDTypography display="block" variant="button" fontWeight="medium">
          {name}
        </MDTypography>
      </MDBox>
    </MDBox>
  );
  const [movies, setMovies] = React.useState([]);
  const fetchMovie = async () => {
    const { data } = await axios.get("https://localhost:7152/api/Movie/GetAll");
    setMovies(data);
    console.log(data);
  };
  React.useEffect(() => {
    fetchMovie();
  }, []);

  const columns = [
    { Header: "Author", accessor: "author", align: "left" },
    { Header: "Description", accessor: "description", align: "left" },
    { Header: "Genre", accessor: "genre", align: "left" },
    { Header: "Year", accessor: "year", align: "left" },
    { Header: "Action", accessor: "action", align: "left" },
  ];

  const rows = movies.map((movie) => {
    return {
      author: <Movie image={movie.imageUrl} name={movie.name} />,
      description: (
        <MDTypography component="a" href="#" variant="caption" color="text" fontWeight="medium">
          {movie.description.slice(0, 10)}...
        </MDTypography>
      ),
      genre: (
        <MDTypography component="a" href="#" variant="caption" color="text" fontWeight="medium">
          {movie.genre}
        </MDTypography>
      ),
      year: (
        <MDTypography component="a" href="#" variant="caption" color="text" fontWeight="medium">
          {movie.year}
        </MDTypography>
      ),
      action: (
        <MDBox>
          <Link to={`/movie/update/${movie.id}`}>
            <IconButton>
              <EditIcon style={{ color: "gray" }} />
            </IconButton>
          </Link>

          <IconButton
            onClick={() => {
              deleteGenre(movie.id);
            }}
            aria-label="delete"
          >
            <DeleteIcon
              style={{
                color: "rgba(216, 18, 41, 0.71)",
              }}
            />
          </IconButton>
        </MDBox>
      ),
    };
  });

  return (
    <DashboardLayout>
      <DashboardNavbar />
      <MDBox pt={6} pb={3}>
        <Grid container spacing={6}>
          <Link to="/movie/create">
            <Button
              style={{
                padding: "10px 20px",
                backgroundColor: "#4CAF50",
                color: "white",
                border: "none",
                width: "100px",
                marginLeft: "70px",
                borderRadius: "4px",
                cursor: "pointer",
              }}
            >
              Create
            </Button>
          </Link>
          <Grid item xs={12}>
            <Card>
              <MDBox
                mx={2}
                mt={-3}
                py={3}
                px={2}
                variant="gradient"
                bgColor="info"
                borderRadius="lg"
                coloredShadow="info"
              >
                <MDTypography variant="h6" color="white">
                  Movie Table
                </MDTypography>
              </MDBox>
              <MDBox pt={3}>
                <DataTable
                  table={{ columns, rows }}
                  isSorted={false}
                  entriesPerPage={false}
                  showTotalEntries={false}
                  noEndBorder
                />
              </MDBox>
            </Card>
          </Grid>
        </Grid>
      </MDBox>
    </DashboardLayout>
  );
}
