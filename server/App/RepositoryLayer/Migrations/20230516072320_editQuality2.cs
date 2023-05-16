using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace RepositoryLayer.Migrations
{
    public partial class editQuality2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Social",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 449, DateTimeKind.Utc).AddTicks(7079),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 321, DateTimeKind.Utc).AddTicks(9580));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Serie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 448, DateTimeKind.Utc).AddTicks(9298),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 321, DateTimeKind.Utc).AddTicks(2523));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Season",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 448, DateTimeKind.Utc).AddTicks(8244),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 321, DateTimeKind.Utc).AddTicks(1532));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 448, DateTimeKind.Utc).AddTicks(7413),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 321, DateTimeKind.Utc).AddTicks(765));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Partners",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 447, DateTimeKind.Utc).AddTicks(8692),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 320, DateTimeKind.Utc).AddTicks(2667));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 447, DateTimeKind.Utc).AddTicks(1838),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 319, DateTimeKind.Utc).AddTicks(6476));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 447, DateTimeKind.Utc).AddTicks(313),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 319, DateTimeKind.Utc).AddTicks(4974));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 446, DateTimeKind.Utc).AddTicks(9351),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 319, DateTimeKind.Utc).AddTicks(4179));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 445, DateTimeKind.Utc).AddTicks(8140),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 318, DateTimeKind.Utc).AddTicks(6202));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Episode",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 444, DateTimeKind.Utc).AddTicks(9224),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 317, DateTimeKind.Utc).AddTicks(8940));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 444, DateTimeKind.Utc).AddTicks(8336),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 317, DateTimeKind.Utc).AddTicks(8111));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Actress",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 444, DateTimeKind.Utc).AddTicks(129),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 317, DateTimeKind.Utc).AddTicks(462));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Social",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 321, DateTimeKind.Utc).AddTicks(9580),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 449, DateTimeKind.Utc).AddTicks(7079));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Serie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 321, DateTimeKind.Utc).AddTicks(2523),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 448, DateTimeKind.Utc).AddTicks(9298));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Season",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 321, DateTimeKind.Utc).AddTicks(1532),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 448, DateTimeKind.Utc).AddTicks(8244));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 321, DateTimeKind.Utc).AddTicks(765),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 448, DateTimeKind.Utc).AddTicks(7413));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Partners",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 320, DateTimeKind.Utc).AddTicks(2667),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 447, DateTimeKind.Utc).AddTicks(8692));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 319, DateTimeKind.Utc).AddTicks(6476),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 447, DateTimeKind.Utc).AddTicks(1838));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 319, DateTimeKind.Utc).AddTicks(4974),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 447, DateTimeKind.Utc).AddTicks(313));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 319, DateTimeKind.Utc).AddTicks(4179),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 446, DateTimeKind.Utc).AddTicks(9351));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 318, DateTimeKind.Utc).AddTicks(6202),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 445, DateTimeKind.Utc).AddTicks(8140));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Episode",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 317, DateTimeKind.Utc).AddTicks(8940),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 444, DateTimeKind.Utc).AddTicks(9224));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 317, DateTimeKind.Utc).AddTicks(8111),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 444, DateTimeKind.Utc).AddTicks(8336));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Actress",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 7, 15, 15, 317, DateTimeKind.Utc).AddTicks(462),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 7, 23, 20, 444, DateTimeKind.Utc).AddTicks(129));
        }
    }
}
