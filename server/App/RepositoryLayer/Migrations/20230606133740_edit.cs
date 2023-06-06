using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace RepositoryLayer.Migrations
{
    public partial class edit : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Serie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(2171),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 585, DateTimeKind.Utc).AddTicks(4270));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Season",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(1009),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 585, DateTimeKind.Utc).AddTicks(860));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Quality",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(2923),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 585, DateTimeKind.Utc).AddTicks(5162));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Property",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(3687),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 585, DateTimeKind.Utc).AddTicks(7243));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(75),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 584, DateTimeKind.Utc).AddTicks(9961));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 525, DateTimeKind.Utc).AddTicks(2873),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 581, DateTimeKind.Utc).AddTicks(9844));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 525, DateTimeKind.Utc).AddTicks(1174),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 581, DateTimeKind.Utc).AddTicks(7269));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 525, DateTimeKind.Utc).AddTicks(237),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 581, DateTimeKind.Utc).AddTicks(6387));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 524, DateTimeKind.Utc).AddTicks(301),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 580, DateTimeKind.Utc).AddTicks(7667));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Episode",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 523, DateTimeKind.Utc).AddTicks(1902),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 579, DateTimeKind.Utc).AddTicks(8619));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 523, DateTimeKind.Utc).AddTicks(717),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 579, DateTimeKind.Utc).AddTicks(7501));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Comment",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(4445),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 588, DateTimeKind.Utc).AddTicks(5648));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Actress",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 522, DateTimeKind.Utc).AddTicks(2374),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 578, DateTimeKind.Utc).AddTicks(8692));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Serie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 585, DateTimeKind.Utc).AddTicks(4270),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(2171));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Season",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 585, DateTimeKind.Utc).AddTicks(860),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(1009));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Quality",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 585, DateTimeKind.Utc).AddTicks(5162),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(2923));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Property",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 585, DateTimeKind.Utc).AddTicks(7243),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(3687));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 584, DateTimeKind.Utc).AddTicks(9961),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(75));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 581, DateTimeKind.Utc).AddTicks(9844),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 525, DateTimeKind.Utc).AddTicks(2873));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 581, DateTimeKind.Utc).AddTicks(7269),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 525, DateTimeKind.Utc).AddTicks(1174));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 581, DateTimeKind.Utc).AddTicks(6387),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 525, DateTimeKind.Utc).AddTicks(237));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 580, DateTimeKind.Utc).AddTicks(7667),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 524, DateTimeKind.Utc).AddTicks(301));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Episode",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 579, DateTimeKind.Utc).AddTicks(8619),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 523, DateTimeKind.Utc).AddTicks(1902));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 579, DateTimeKind.Utc).AddTicks(7501),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 523, DateTimeKind.Utc).AddTicks(717));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Comment",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 588, DateTimeKind.Utc).AddTicks(5648),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(4445));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Actress",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 29, 9, 578, DateTimeKind.Utc).AddTicks(8692),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 522, DateTimeKind.Utc).AddTicks(2374));
        }
    }
}
