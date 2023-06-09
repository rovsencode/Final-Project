// @mui material components
import Grid from "@mui/material/Grid";
import Card from "@mui/material/Card";
import DeleteIcon from "@mui/icons-material/Delete";
import EditIcon from "@mui/icons-material/Edit";
import IconButton from "@mui/material/IconButton";
// Material Dashboard 2 React example components
import DashboardLayout from "examples/LayoutContainers/DashboardLayout";
import DashboardNavbar from "examples/Navbars/DashboardNavbar";

// Material Dashboard 2 React components
import MDBox from "components/MDBox";
import MDTypography from "components/MDTypography";
import axios from "axios";
import React from "react";
import DataTable from "examples/Tables/DataTable";
import { Button } from "@mui/material";
import { Link } from "react-router-dom";
export default function GenreTable() {
  const [genres, setGenres] = React.useState([]);
  const fetchGenre = async () => {
    const { data } = await axios.get("https://localhost:7152/api/Genre/GetAll");
    setGenres(data);
    console.log(data);
  };
  const deleteGenre = async (genreId) => [
    await axios.delete(`https://localhost:7152/api/Genre/SoftDelete/${genreId}`),
    fetchGenre(),
  ];
  React.useEffect(() => {
    fetchGenre();
  }, []);

  const columns = [
    { Header: "Genre", accessor: "genre", align: "left" },
    { Header: "Action", accessor: "action", align: "left" },
  ];

  const rows = genres.map((genre) => {
    return {
      genre: (
        <MDTypography component="a" href="#" variant="caption" color="text" fontWeight="medium">
          {genre.name}
        </MDTypography>
      ),
      action: (
        <MDBox>
          <Link to={`/genre/update/${genre.id}`}>
            <IconButton>
              <EditIcon style={{ color: "gray" }} />
            </IconButton>
          </Link>

          <IconButton
            onClick={() => {
              deleteGenre(genre.id);
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
          <Link to="/genre/create">
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
                  Genre Table
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
