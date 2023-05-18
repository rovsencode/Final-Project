using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace RepositoryLayer.Migrations
{
    public partial class editFaqTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Social",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(8669),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(6799));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Serie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(2380),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(2252));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Season",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(1644),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(1605));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Quality",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(9175),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(7215));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Property",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(9724),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(7732));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(1030),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(1088));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Partners",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 290, DateTimeKind.Utc).AddTicks(1095),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 730, DateTimeKind.Utc).AddTicks(6802));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 289, DateTimeKind.Utc).AddTicks(4937),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 730, DateTimeKind.Utc).AddTicks(3043));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 289, DateTimeKind.Utc).AddTicks(3846),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 730, DateTimeKind.Utc).AddTicks(2038));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 289, DateTimeKind.Utc).AddTicks(3219),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 730, DateTimeKind.Utc).AddTicks(1556));

            migrationBuilder.AlterColumn<string>(
                name: "Description",
                table: "Faq",
                type: "nvarchar(500)",
                maxLength: 500,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(50)",
                oldMaxLength: 50);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 288, DateTimeKind.Utc).AddTicks(6764),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 729, DateTimeKind.Utc).AddTicks(6565));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Episode",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 288, DateTimeKind.Utc).AddTicks(719),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 729, DateTimeKind.Utc).AddTicks(2191));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 288, DateTimeKind.Utc).AddTicks(109),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 729, DateTimeKind.Utc).AddTicks(1677));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Actress",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 287, DateTimeKind.Utc).AddTicks(3807),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 728, DateTimeKind.Utc).AddTicks(7041));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Social",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(6799),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(8669));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Serie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(2252),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(2380));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Season",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(1605),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(1644));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Quality",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(7215),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(9175));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Property",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(7732),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(9724));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 732, DateTimeKind.Utc).AddTicks(1088),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 292, DateTimeKind.Utc).AddTicks(1030));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Partners",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 730, DateTimeKind.Utc).AddTicks(6802),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 290, DateTimeKind.Utc).AddTicks(1095));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 730, DateTimeKind.Utc).AddTicks(3043),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 289, DateTimeKind.Utc).AddTicks(4937));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 730, DateTimeKind.Utc).AddTicks(2038),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 289, DateTimeKind.Utc).AddTicks(3846));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 730, DateTimeKind.Utc).AddTicks(1556),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 289, DateTimeKind.Utc).AddTicks(3219));

            migrationBuilder.AlterColumn<string>(
                name: "Description",
                table: "Faq",
                type: "nvarchar(50)",
                maxLength: 50,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(500)",
                oldMaxLength: 500);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 729, DateTimeKind.Utc).AddTicks(6565),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 288, DateTimeKind.Utc).AddTicks(6764));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Episode",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 729, DateTimeKind.Utc).AddTicks(2191),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 288, DateTimeKind.Utc).AddTicks(719));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 729, DateTimeKind.Utc).AddTicks(1677),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 288, DateTimeKind.Utc).AddTicks(109));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Actress",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 18, 15, 9, 21, 728, DateTimeKind.Utc).AddTicks(7041),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 18, 16, 53, 48, 287, DateTimeKind.Utc).AddTicks(3807));
        }
    }
}
