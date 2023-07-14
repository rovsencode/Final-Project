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

// Material Dashboard 2 React example components
import DashboardLayout from "examples/LayoutContainers/DashboardLayout";
import DashboardNavbar from "examples/Navbars/DashboardNavbar";
import { Button } from "@mui/material";
import { Link } from "react-router-dom";
import DeleteIcon from "@mui/icons-material/Delete";
import EditIcon from "@mui/icons-material/Edit";
import IconButton from "@mui/material/IconButton";
// Material Dashboard 2 React components
import MDBox from "components/MDBox";
import MDTypography from "components/MDTypography";
import MDAvatar from "components/MDAvatar";
import axios from "axios";
import React from "react";
import DataTable from "examples/Tables/DataTable";

export default function ContactTable() {
  const deleteContact = async (contactId) => {
    const { data } = await axios.delete(
      `http://flixgo-001-site1.ctempurl.com/api/Contact/Delete/${contactId}`
    );
    fetchContact();
  };
  const [contacts, setContacts] = React.useState([]);
  const fetchContact = async () => {
    const { data } = await axios.get("http://flixgo-001-site1.ctempurl.com/api/Contact/GetAll");
    setContacts(data);
    console.log(data);
  };
  React.useEffect(() => {
    fetchContact();
  }, []);

  const columns = [
    { Header: "Email", accessor: "email", align: "left" },
    { Header: "PhoneNumber", accessor: "phoneNumber", align: "left" },
    { Header: "Action", accessor: "action", align: "left" },
  ];

  const rows = contacts.map((contact) => {
    return {
      email: (
        <MDTypography component="a" href="#" variant="caption" color="text" fontWeight="medium">
          {contact.mailAccount}
        </MDTypography>
      ),
      phoneNumber: (
        <MDTypography component="a" href="#" variant="caption" color="text" fontWeight="medium">
          {contact.phoneNumber}
        </MDTypography>
      ),
      action: (
        <MDBox>
          <IconButton
            onClick={() => {
              deleteContact(contact.id);
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
          <Link to="/contact/create">
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
                  Contacts Table
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
