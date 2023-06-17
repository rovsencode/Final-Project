using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace RepositoryLayer.Migrations
{
    public partial class editThings : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<bool>(
                name: "isDeleted",
                table: "Serie",
                type: "bit",
                nullable: false,
                oldClrType: typeof(bool),
                oldType: "bit",
                oldDefaultValue: false);

            migrationBuilder.AlterColumn<string>(
                name: "Name",
                table: "Serie",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(50)",
                oldMaxLength: 50);

            migrationBuilder.AlterColumn<string>(
                name: "Description",
                table: "Serie",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(100)",
                oldMaxLength: 100);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Serie",
                type: "datetime2",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(2171));

            migrationBuilder.AlterColumn<bool>(
                name: "isDeleted",
                table: "Season",
                type: "bit",
                nullable: false,
                oldClrType: typeof(bool),
                oldType: "bit",
                oldDefaultValue: false);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Season",
                type: "datetime2",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(1009));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Quality",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 333, DateTimeKind.Utc).AddTicks(6495),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(2923));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Property",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 333, DateTimeKind.Utc).AddTicks(7856),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(3687));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 333, DateTimeKind.Utc).AddTicks(4911),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(75));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 329, DateTimeKind.Utc).AddTicks(4082),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 525, DateTimeKind.Utc).AddTicks(2873));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 329, DateTimeKind.Utc).AddTicks(2168),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 525, DateTimeKind.Utc).AddTicks(1174));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 329, DateTimeKind.Utc).AddTicks(686),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 525, DateTimeKind.Utc).AddTicks(237));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 327, DateTimeKind.Utc).AddTicks(9153),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 524, DateTimeKind.Utc).AddTicks(301));

            migrationBuilder.AlterColumn<bool>(
                name: "isDeleted",
                table: "Episode",
                type: "bit",
                nullable: false,
                oldClrType: typeof(bool),
                oldType: "bit",
                oldDefaultValue: false);

            migrationBuilder.AlterColumn<string>(
                name: "EpisodeTitle",
                table: "Episode",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(50)",
                oldMaxLength: 50);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Episode",
                type: "datetime2",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 523, DateTimeKind.Utc).AddTicks(1902));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 326, DateTimeKind.Utc).AddTicks(7320),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 523, DateTimeKind.Utc).AddTicks(717));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Comment",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 333, DateTimeKind.Utc).AddTicks(9204),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(4445));

            migrationBuilder.AlterColumn<bool>(
                name: "isDeleted",
                table: "Actress",
                type: "bit",
                nullable: false,
                oldClrType: typeof(bool),
                oldType: "bit",
                oldDefaultValue: false);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Actress",
                type: "datetime2",
                nullable: false,
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 522, DateTimeKind.Utc).AddTicks(2374));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<bool>(
                name: "isDeleted",
                table: "Serie",
                type: "bit",
                nullable: false,
                defaultValue: false,
                oldClrType: typeof(bool),
                oldType: "bit");

            migrationBuilder.AlterColumn<string>(
                name: "Name",
                table: "Serie",
                type: "nvarchar(50)",
                maxLength: 50,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<string>(
                name: "Description",
                table: "Serie",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Serie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(2171),
                oldClrType: typeof(DateTime),
                oldType: "datetime2");

            migrationBuilder.AlterColumn<bool>(
                name: "isDeleted",
                table: "Season",
                type: "bit",
                nullable: false,
                defaultValue: false,
                oldClrType: typeof(bool),
                oldType: "bit");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Season",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(1009),
                oldClrType: typeof(DateTime),
                oldType: "datetime2");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Quality",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(2923),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 333, DateTimeKind.Utc).AddTicks(6495));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Property",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(3687),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 333, DateTimeKind.Utc).AddTicks(7856));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(75),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 333, DateTimeKind.Utc).AddTicks(4911));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 525, DateTimeKind.Utc).AddTicks(2873),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 329, DateTimeKind.Utc).AddTicks(4082));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 525, DateTimeKind.Utc).AddTicks(1174),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 329, DateTimeKind.Utc).AddTicks(2168));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 525, DateTimeKind.Utc).AddTicks(237),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 329, DateTimeKind.Utc).AddTicks(686));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 524, DateTimeKind.Utc).AddTicks(301),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 327, DateTimeKind.Utc).AddTicks(9153));

            migrationBuilder.AlterColumn<bool>(
                name: "isDeleted",
                table: "Episode",
                type: "bit",
                nullable: false,
                defaultValue: false,
                oldClrType: typeof(bool),
                oldType: "bit");

            migrationBuilder.AlterColumn<string>(
                name: "EpisodeTitle",
                table: "Episode",
                type: "nvarchar(50)",
                maxLength: 50,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Episode",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 523, DateTimeKind.Utc).AddTicks(1902),
                oldClrType: typeof(DateTime),
                oldType: "datetime2");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 523, DateTimeKind.Utc).AddTicks(717),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 326, DateTimeKind.Utc).AddTicks(7320));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Comment",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 528, DateTimeKind.Utc).AddTicks(4445),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 15, 11, 48, 35, 333, DateTimeKind.Utc).AddTicks(9204));

            migrationBuilder.AlterColumn<bool>(
                name: "isDeleted",
                table: "Actress",
                type: "bit",
                nullable: false,
                defaultValue: false,
                oldClrType: typeof(bool),
                oldType: "bit");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Actress",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 6, 13, 37, 40, 522, DateTimeKind.Utc).AddTicks(2374),
                oldClrType: typeof(DateTime),
                oldType: "datetime2");
        }
    }
}
