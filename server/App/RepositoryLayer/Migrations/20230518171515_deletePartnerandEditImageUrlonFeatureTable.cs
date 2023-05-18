using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace RepositoryLayer.Migrations
{
    public partial class deletePartnerandEditImageUrlonFeatureTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Partners");

            migrationBuilder.DropColumn(
                name: "ImageUrL",
                table: "Feature");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Social",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 454, DateTimeKind.Utc).AddTicks(1106),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(8669));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Serie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 453, DateTimeKind.Utc).AddTicks(6820),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(2380));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Season",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 453, DateTimeKind.Utc).AddTicks(6190),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(1644));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Quality",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 454, DateTimeKind.Utc).AddTicks(1495),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(9175));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Property",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 454, DateTimeKind.Utc).AddTicks(1908),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(9724));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 453, DateTimeKind.Utc).AddTicks(5695),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(1030));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 452, DateTimeKind.Utc).AddTicks(1365),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 289, DateTimeKind.Utc).AddTicks(4937));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 452, DateTimeKind.Utc).AddTicks(521),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 289, DateTimeKind.Utc).AddTicks(3846));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 451, DateTimeKind.Utc).AddTicks(9884),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 289, DateTimeKind.Utc).AddTicks(3219));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 451, DateTimeKind.Utc).AddTicks(5684),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 288, DateTimeKind.Utc).AddTicks(6764));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Episode",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 451, DateTimeKind.Utc).AddTicks(1381),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 288, DateTimeKind.Utc).AddTicks(719));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 451, DateTimeKind.Utc).AddTicks(925),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 288, DateTimeKind.Utc).AddTicks(109));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Actress",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 450, DateTimeKind.Utc).AddTicks(6314),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 287, DateTimeKind.Utc).AddTicks(3807));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Social",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(8669),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 454, DateTimeKind.Utc).AddTicks(1106));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Serie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(2380),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 453, DateTimeKind.Utc).AddTicks(6820));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Season",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(1644),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 453, DateTimeKind.Utc).AddTicks(6190));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Quality",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(9175),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 454, DateTimeKind.Utc).AddTicks(1495));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Property",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(9724),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 454, DateTimeKind.Utc).AddTicks(1908));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(1030),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 453, DateTimeKind.Utc).AddTicks(5695));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 289, DateTimeKind.Utc).AddTicks(4937),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 452, DateTimeKind.Utc).AddTicks(1365));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 289, DateTimeKind.Utc).AddTicks(3846),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 452, DateTimeKind.Utc).AddTicks(521));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 289, DateTimeKind.Utc).AddTicks(3219),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 451, DateTimeKind.Utc).AddTicks(9884));

            migrationBuilder.AddColumn<string>(
                name: "ImageUrL",
                table: "Feature",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 288, DateTimeKind.Utc).AddTicks(6764),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 451, DateTimeKind.Utc).AddTicks(5684));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Episode",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 288, DateTimeKind.Utc).AddTicks(719),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 451, DateTimeKind.Utc).AddTicks(1381));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 288, DateTimeKind.Utc).AddTicks(109),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 451, DateTimeKind.Utc).AddTicks(925));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Actress",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 287, DateTimeKind.Utc).AddTicks(3807),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 17, 15, 15, 450, DateTimeKind.Utc).AddTicks(6314));

            migrationBuilder.CreateTable(
                name: "Partners",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedTime = table.Column<DateTime>(type: "datetime2", nullable: false, defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 290, DateTimeKind.Utc).AddTicks(1095)),
                    ImageUrl = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    isDeleted = table.Column<bool>(type: "bit", nullable: false, defaultValue: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Partners", x => x.Id);
                });
        }
    }
}
