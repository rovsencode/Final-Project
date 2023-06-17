using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace RepositoryLayer.Migrations
{
    public partial class addUserPlan : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Quality",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(6584),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 333, DateTimeKind.Utc).AddTicks(6495));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Property",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(7040),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 333, DateTimeKind.Utc).AddTicks(7856));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(6175),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 333, DateTimeKind.Utc).AddTicks(4911));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(5698),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 329, DateTimeKind.Utc).AddTicks(4082));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(4718),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 329, DateTimeKind.Utc).AddTicks(2168));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(4229),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 329, DateTimeKind.Utc).AddTicks(686));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 513, DateTimeKind.Utc).AddTicks(9487),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 327, DateTimeKind.Utc).AddTicks(9153));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 513, DateTimeKind.Utc).AddTicks(4564),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 326, DateTimeKind.Utc).AddTicks(7320));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Comment",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(7627),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 333, DateTimeKind.Utc).AddTicks(9204));

            migrationBuilder.AddColumn<int>(
                name: "PlanId",
                table: "AspNetUsers",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUsers_PlanId",
                table: "AspNetUsers",
                column: "PlanId");

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_PricingPlans_PlanId",
                table: "AspNetUsers",
                column: "PlanId",
                principalTable: "PricingPlans",
                principalColumn: "Id");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_PricingPlans_PlanId",
                table: "AspNetUsers");

            migrationBuilder.DropIndex(
                name: "IX_AspNetUsers_PlanId",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "PlanId",
                table: "AspNetUsers");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Quality",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 333, DateTimeKind.Utc).AddTicks(6495),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(6584));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Property",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 333, DateTimeKind.Utc).AddTicks(7856),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(7040));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 333, DateTimeKind.Utc).AddTicks(4911),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(6175));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 329, DateTimeKind.Utc).AddTicks(4082),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(5698));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 329, DateTimeKind.Utc).AddTicks(2168),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(4718));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 329, DateTimeKind.Utc).AddTicks(686),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(4229));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 327, DateTimeKind.Utc).AddTicks(9153),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 513, DateTimeKind.Utc).AddTicks(9487));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 326, DateTimeKind.Utc).AddTicks(7320),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 513, DateTimeKind.Utc).AddTicks(4564));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Comment",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 333, DateTimeKind.Utc).AddTicks(9204),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 12, 13, 20, 514, DateTimeKind.Utc).AddTicks(7627));
        }
    }
}
